# Onboarding masivo de miembros

Este procedimiento invita usuarios de GitHub a la organización y los añade al equipo indicado. Las contribuciones públicas no requieren membresía: cualquier persona puede hacer fork y abrir Pull Requests.

## Asignación de equipos

| Equipo | Uso | Permiso en `ai-community` |
| --- | --- | --- |
| `community` | Colaboradores activos reconocidos por la comunidad. | Sin permiso adicional; el repositorio es público. |
| `mentors` | Mentoría, moderación de issues y apoyo a contributors. | Triage. |
| `maintainers` | Revisión, aprobación y mantenimiento técnico. | Maintain. |

No uses este proceso para otorgar permisos de administrador ni para añadir masivamente a todos los participantes públicos a la organización.

## Preparar el CSV

Crea un archivo UTF-8 llamado `users.csv` con la cabecera exacta y una fila por usuario:

```csv
github_username,team
ana-dev,maintainers
luis-ai,mentors
maria-data,community
carlos-ml,community
```

Cada nombre de usuario debe existir en GitHub. Los equipos permitidos son `community`, `mentors` y `maintainers`.

## Simular primero

En PowerShell, desde la raíz del repositorio:

```powershell
$env:GITHUB_ORG="DataScienceResearchPeru"
$env:Path="C:\Program Files\GitHub CLI;$env:Path"

& "C:\Program Files\Git\bin\bash.exe" scripts/onboarding/onboard-community.sh users.csv --dry-run
```

El comando valida el archivo, la autenticación, los usuarios y los equipos, sin realizar cambios. Revisa cuidadosamente la lista `Would invite`.

## Enviar invitaciones

Cuando el resultado de la simulación sea correcto, ejecuta:

```powershell
& "C:\Program Files\Git\bin\bash.exe" scripts/onboarding/onboard-community.sh users.csv
```

El script vuelve a validar los datos, muestra la lista de invitaciones y solicita confirmación. Procesa cada fila de forma independiente: un usuario inválido no detiene las demás invitaciones. Al terminar genera un archivo de log con el resumen.

## Revisores de Pull Requests

La protección de `main` exige una aprobación independiente. El autor de un Pull Request no puede proporcionar la aprobación requerida para su propio cambio, incluso si es administrador.

Para habilitar una revisión:

1. Añade al menos una cuenta distinta del autor al equipo `maintainers` mediante el CSV.
2. Espera a que acepte la invitación a la organización.
3. La persona revisa el Pull Request y selecciona **Approve**.
4. Con los checks en verde y la aprobación registrada, un maintainer puede hacer merge.

## Solución de problemas

- **`gh` no se reconoce:** abre una terminal nueva después de instalar GitHub CLI o añade temporalmente `C:\Program Files\GitHub CLI` a `PATH`.
- **Usuario no encontrado:** confirma el nombre de usuario sin `@` ni URL.
- **Equipo no encontrado:** ejecuta `scripts/github/create-teams.sh --dry-run` y confirma que existen los equipos requeridos.
- **Invitación pendiente:** el usuario debe aceptarla antes de acceder como miembro de la organización.
- **No expongas secretos:** no incluyas tokens, contraseñas ni datos personales adicionales en el CSV o en los logs.
