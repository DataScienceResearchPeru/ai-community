#!/usr/bin/env bash
set -euo pipefail

dry_run=false
[[ "${1:-}" == "--dry-run" ]] && dry_run=true
command -v gh >/dev/null || { echo 'GitHub CLI is required.'; exit 1; }
gh auth status
org="${GITHUB_ORG:?Set GITHUB_ORG}"
repo="${GITHUB_REPO:-ai-community}"
echo "Proposed settings for $org/$repo: public repository, description/topics, Discussions enabled, and main branch rules: PRs, one approval, resolved conversations, required checks, no force pushes."
echo 'Review current GitHub plan and existing rules before applying. This script intentionally does not change branch protection or existing security settings.'
$dry_run && exit 0
echo 'No changes made: branch protection requires an explicit reviewed configuration for the detected GitHub plan.'
