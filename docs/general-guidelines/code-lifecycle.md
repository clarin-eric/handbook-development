# Code lifecycle

## Releasing

-   Document the release in repository system
    -   For images: specify version of base image os and relevant software packages (also if not changed)
        -   Base images: alpine version, e.g. java version

Release process and actions

-   Alpha
    -   Feature developments
    -   Dependencies can still change, updates to new minor versions
-   Beta
    -   Freeze features
    -   Bug fixes
    -   Dependency checks, update to latest within minor
-   RC
    -   Bugs must be fixed or documented as known issues
    -   Final dependency checks, main focus on security (high and critical vulnerability must be resolved)
