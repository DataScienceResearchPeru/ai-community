#!/usr/bin/env bash
set -euo pipefail

dry_run=false
apply_protection=false
for argument in "$@"; do
  [[ "$argument" == "--dry-run" ]] && dry_run=true
  [[ "$argument" == "--apply-branch-protection" ]] && apply_protection=true
done
command -v gh >/dev/null || { echo 'GitHub CLI is required.'; exit 1; }
gh auth status
org="${GITHUB_ORG:?Set GITHUB_ORG}"
repo="${GITHUB_REPO:-ai-community}"
visibility="$(gh repo view "$org/$repo" --json visibility --jq .visibility)"
[[ "$visibility" == "PUBLIC" ]] || { echo 'Branch protection requires a public repository on this organization plan.'; exit 1; }
echo "Proposed protection for $org/$repo main: PRs, one approval, resolved conversations, required checks, no force pushes, and administrator enforcement."
$dry_run && exit 0
$apply_protection || { echo 'No changes made. Use --apply-branch-protection after reviewing scripts/github/main-branch-protection.json.'; exit 0; }
gh api --method PUT "repos/$org/$repo/branches/main/protection" --input scripts/github/main-branch-protection.json >/dev/null
echo 'Applied main branch protection.'
