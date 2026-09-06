#!/usr/bin/env bash
set -euo pipefail

command -v gh >/dev/null || { echo 'GitHub CLI is required: https://cli.github.com/'; exit 1; }
gh auth status
org="${GITHUB_ORG:?Set GITHUB_ORG}"
repo="${GITHUB_REPO:-ai-community}"
echo "Organization: $org"
gh repo list "$org" --limit 100 --json name,visibility,url --jq '.[] | [.name,.visibility,.url] | @tsv'
gh api "orgs/$org/teams" --paginate --jq '.[] | [.slug,.name,.privacy] | @tsv'
gh repo view "$org/$repo" --json name,visibility,description,url,isPrivate 2>/dev/null || true
