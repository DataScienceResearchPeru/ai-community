# GitHub audit

Generated: 2026-09-06 (America/Lima)

## Environment

- Git: `2.55.0.windows.5`
- GitHub CLI: installed and authenticated as `Cuica20` through the system keyring.
- GitHub token scopes verified: `gist`, `read:org`, `repo`, `workflow`.
- Viewer role for `DataScienceResearchPeru/ai-community`: `ADMIN`.

## Detected repository and organization

- Repository: `DataScienceResearchPeru/ai-community`.
- Visibility: public. The DSRP AI Community description and 15 approved topics are configured.
- Issues and Discussions are enabled.
- Default branch: `feature/community-foundation`; `main` does not yet exist.
- The pushed foundation commit is `5551e18` on `origin/feature/community-foundation`.
- Organization: `DataScienceResearchPeru`, plan `free`, 106 public repositories and 6 private repositories.
- Existing teams: `dsrp-github-team`, `community`, `mentors`, and `maintainers` (all closed).
- Repository permissions: `mentors` has Triage and `maintainers` has Maintain. `community` has no additional repository permission because public contributors use forks and Pull Requests.
- Main branch protection requires Pull Requests, one approval, resolved conversations, current required checks, and applies to administrators. Force pushes and deletions are disabled.
- Related repositories include `AI_Curriculum`, `Semilleros-DSRP`, `Retos`, `GithubParticipantes`, `rules`, and many public learning repositories.

## Risks

- Public repository content is visible to everyone; contributors must continue to avoid secrets, private data, and client data.
- The protected branch requires an independent approving review, so at least one additional eligible reviewer should be available before routine merges.
- The feature branch remains available for review and must not be deleted until the community confirms the transition.

## Recommendations and proposed actions

1. Obtain an independent review and merge Pull Request #1 once approved.
2. Configure the recommended Discussions categories manually: Announcements, General, Ideas, Projects, Challenges, Help, Show and Tell, and AI News.
3. Add mentors and maintainers deliberately through the onboarding workflow; do not add all public contributors to the organization.
4. Revisit required checks whenever a workflow name changes.
