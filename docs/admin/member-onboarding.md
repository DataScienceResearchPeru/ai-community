# Member onboarding

Prepare a CSV with `github_username,team`, then run `scripts/onboarding/onboard-community.sh users.csv --dry-run`. Review candidates and rerun without `--dry-run` to send invitations. The script validates each entry, logs results, and continues after per-user failures.
