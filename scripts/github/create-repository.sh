#!/usr/bin/env bash
set -euo pipefail

dry_run=false
[[ "${1:-}" == "--dry-run" ]] && dry_run=true
command -v gh >/dev/null || { echo 'GitHub CLI is required.'; exit 1; }
gh auth status
org="${GITHUB_ORG:?Set GITHUB_ORG}"
repo="${GITHUB_REPO:-ai-community}"
description='Open AI community by Data Science Research Perú. Learn, build and share projects in AI, Agents, RAG, MCP and AI Engineering.'
topics='artificial-intelligence,ai,machine-learning,ai-agents,rag,mcp,llm,python,codex,claude,gemini,open-source,community,data-science,ai-engineering'
if gh repo view "$org/$repo" >/dev/null 2>&1; then echo "Repository exists: $org/$repo"; exit 0; fi
echo "Would create public repository: $org/$repo"
echo "Description: $description"
echo "Topics: $topics"
$dry_run && exit 0
gh repo create "$org/$repo" --public --description "$description"
gh repo edit "$org/$repo" --add-topic "$topics"
