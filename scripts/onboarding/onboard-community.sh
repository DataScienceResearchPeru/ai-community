#!/usr/bin/env bash
set -euo pipefail

csv="${1:-}"
dry_run=false
[[ "${2:-}" == "--dry-run" ]] && dry_run=true
[[ -n "$csv" && -f "$csv" ]] || { echo 'Usage: onboard-community.sh users.csv [--dry-run]'; exit 1; }
command -v gh >/dev/null || { echo 'GitHub CLI is required.'; exit 1; }
gh auth status
org="${GITHUB_ORG:?Set GITHUB_ORG}"
log="onboarding-$(date +%Y%m%d-%H%M%S).log"
valid_teams="${TEAM_COMMUNITY:-community} ${TEAM_MENTORS:-mentors} ${TEAM_MAINTAINERS:-maintainers}"
mapfile -t rows < <(tail -n +2 "$csv")
[[ ${#rows[@]} -gt 0 ]] || { echo 'CSV has no users.'; exit 1; }
for row in "${rows[@]}"; do
  IFS=, read -r user team <<< "$row"
  [[ "$user" =~ ^[A-Za-z0-9-]+$ ]] || { echo "Invalid username: $user"; exit 1; }
  [[ " $valid_teams " == *" $team "* ]] || { echo "Invalid team: $team"; exit 1; }
done
echo 'Would invite:'
printf '%s\n' "${rows[@]}" | sed 's/,/ → /'
$dry_run && exit 0
read -r -p 'Send these invitations? [y/N] ' answer
[[ "$answer" =~ ^[Yy]$ ]] || { echo 'Cancelled.'; exit 0; }
success=0; failed=0
for row in "${rows[@]}"; do
  IFS=, read -r user team <<< "$row"
  if ! gh api "users/$user" >/dev/null 2>&1; then echo "FAILED user not found: $user" | tee -a "$log"; ((failed+=1)); continue; fi
  if ! gh api "orgs/$org/teams/$team" >/dev/null 2>&1; then echo "FAILED team not found: $team" | tee -a "$log"; ((failed+=1)); continue; fi
  if gh api --method PUT "orgs/$org/teams/$team/memberships/$user" -f role=member >/dev/null; then echo "INVITED $user → $team" | tee -a "$log"; ((success+=1)); else echo "FAILED $user → $team" | tee -a "$log"; ((failed+=1)); fi
done
echo "Summary: invited=$success failed=$failed log=$log"
