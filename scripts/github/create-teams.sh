#!/usr/bin/env bash
set -euo pipefail

dry_run=false
[[ "${1:-}" == "--dry-run" ]] && dry_run=true
command -v gh >/dev/null || { echo 'GitHub CLI is required.'; exit 1; }
gh auth status
org="${GITHUB_ORG:?Set GITHUB_ORG}"
for team in "${TEAM_COMMUNITY:-community}" "${TEAM_MENTORS:-mentors}" "${TEAM_MAINTAINERS:-maintainers}"; do
  if gh api "orgs/$org/teams/$team" >/dev/null 2>&1; then
    echo "Team exists; no changes: $team"
  else
    if $dry_run; then
      echo "Would create team: $team (closed)"
    else
      echo "Creating team: $team (closed)"
      gh api --method POST "orgs/$org/teams" -f name="$team" -f privacy=closed >/dev/null
    fi
  fi
done
