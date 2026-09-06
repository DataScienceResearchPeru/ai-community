# GitHub audit

Generated: 2026-09-06 (America/Lima)

## Environment

- Git: `2.55.0.windows.5`
- GitHub CLI: installed and authenticated as `Cuica20` through the system keyring.
- GitHub token scopes verified: `gist`, `read:org`, `repo`, `workflow`.
- Viewer role for `DataScienceResearchPeru/ai-community`: `ADMIN`.

## Detected repository and organization

- Repository: `DataScienceResearchPeru/ai-community`.
- Visibility: private. Description and topics are empty.
- Issues are enabled; Discussions are disabled.
- Default branch: `feature/community-foundation`; `main` does not yet exist.
- The pushed foundation commit is `5551e18` on `origin/feature/community-foundation`.
- Organization: `DataScienceResearchPeru`, plan `free`, 106 public repositories and 6 private repositories.
- Existing team: `dsrp-github-team` (closed). The proposed `community`, `mentors`, and `maintainers` teams do not exist.
- Related repositories include `AI_Curriculum`, `Semilleros-DSRP`, `Retos`, `GithubParticipantes`, `rules`, and many public learning repositories.

## Risks

- GitHub's API rejects branch protection for this private repository on the Free plan. It must be public before protections for `main` can be applied.
- Changing public visibility exposes all current and future repository content. Review the branch before making that change.
- Making `main` the default branch requires first creating it from the reviewed foundation commit. The existing feature branch should be retained until the transition is confirmed.

## Recommendations and proposed actions

1. Review the foundation branch, then create `main` from commit `5551e18` and set it as the default branch.
2. Change the repository to public, add the approved description and topics, and enable Discussions.
3. Create the three proposed teams only if desired; do not modify `dsrp-github-team`.
4. Once public, recheck branch-protection availability and apply the reviewed rule for `main`.
