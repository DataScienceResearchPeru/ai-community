# AGENTS.md — DSRP AI Community

## Memoria padre y contexto

Lee primero [`../CLAUDE.md`](../CLAUDE.md). Es la memoria central de Data Science Research Perú (DSRP): marca, idioma, políticas de datos, estructura de trabajo y skills del equipo.

Esta memoria complementa a `CLAUDE.md` solo para el repositorio `ai-community`. Si hay conflicto, las instrucciones explícitas del usuario y la memoria padre tienen prioridad.

## Propósito del repositorio

`DataScienceResearchPeru/ai-community` es el hub público de la comunidad open-source de IA de DSRP. Su modelo de participación es:

```text
Visitor → Contributor → Community Member → AI Builder → Mentor → Maintainer
```

Las contribuciones públicas ocurren mediante fork, rama de feature, Pull Request, checks, revisión y merge. No se debe añadir masivamente a participantes a la organización.

## Estado verificado — 2026-09-06

- Repositorio: `https://github.com/DataScienceResearchPeru/ai-community`.
- Visibilidad: pública.
- Rama por defecto: `main`.
- Issues y Discussions: habilitados.
- Metadatos: descripción y 15 topics de IA configurados.
- Equipos cerrados: `community`, `mentors`, `maintainers`; el equipo anterior `dsrp-github-team` no fue modificado.
- Permisos del repositorio: `mentors` tiene Triage; `maintainers` tiene Maintain; `community` no necesita permiso adicional en un repositorio público.
- `main` está protegido: PR obligatorio, una aprobación, conversaciones resueltas, checks requeridos, aplicación a administradores, force push y eliminación bloqueados.
- Checks requeridos: `Validate pull request / validate`, `Markdown check / markdown`, `Project structure / project-readme`.
- Pull Request activo: #1 desde `feature/community-foundation`; sus checks pasan y requiere una aprobación independiente antes de merge.

Ver el informe vigente en [`reports/github-audit.md`](reports/github-audit.md). Actualízalo cuando cambie una configuración estable.

## Reglas operativas

1. Trabaja en una rama de feature; no hagas commits directos a `main`.
2. No borres repositorios, ramas, equipos, miembros, releases, Actions ni configuraciones existentes.
3. Antes de cambios remotos, inspecciona con `gh auth status`, muestra el cambio propuesto y valida permisos/configuración existente.
4. No imprimas tokens, credenciales, datos privados ni contenido de `.env`.
5. Usa `--dry-run` primero para scripts que puedan modificar GitHub.
6. Mantén los nombres de workflows requeridos si la protección de `main` los referencia; si cambian, actualiza la protección antes de fusionar el cambio.
7. No des acceso de administrador mediante automatización. Mantén membresía de organización como excepción para colaboradores activos, mentors y maintainers.

## Estructura y fuentes de verdad

- `GOVERNANCE.md`: roles y decisiones de comunidad.
- `CONTRIBUTING.md`, `docs/contribution-guide.md`: flujo de contribución.
- `SECURITY.md` y `.gitignore`: manejo de secretos y datos.
- `.github/`: templates, CODEOWNERS y workflows.
- `docs/admin/`: operación manual de la comunidad.
- `scripts/github/`: auditoría, equipos y protección de ramas.
- `scripts/onboarding/`: invitaciones desde CSV, con confirmación y `--dry-run`.

## Administración de GitHub

Carga valores no secretos desde `community.config.example.env` en variables de entorno. Nunca guardes un token en el repositorio.

En Windows, si una sesión no encuentra `gh` tras instalarlo, usa explícitamente:

```powershell
& "C:\Program Files\GitHub CLI\gh.exe" auth status
```

Antes de aplicar protección, revisa el resultado:

```bash
scripts/github/configure-repository.sh --dry-run
```

La aplicación explícita usa el payload versionado en `scripts/github/main-branch-protection.json`:

```bash
scripts/github/configure-repository.sh --apply-branch-protection
```

## Trabajo pendiente

1. Un maintainer o revisor elegible distinto del autor debe aprobar el PR #1.
2. Fusionar el PR #1 únicamente después de esa aprobación y de checks exitosos.
3. Crear manualmente las categorías de Discussions: Announcements, General, Ideas, Projects, Challenges, Help, Show and Tell y AI News.
4. Usar `scripts/onboarding/onboard-community.sh users.csv --dry-run` antes de invitar miembros.
