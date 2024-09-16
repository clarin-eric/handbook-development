# Security

## Protection against vulnerability exploitation

General guideline: vulnerability checks/scans should be applied regularly (on pushes, on release, while deployed) at code and/or binary levels

General guideline: any known vulnerability with HIGH or CRITICAL severity should be looked into and if at all possible available fix(es) should be applied.

### Application code

-   Use up-to-date dependencies
    -   Run check (e.g. [Maven dependency plugin](https://maven.apache.org/plugins/maven-dependency-plugin/analyze-mojo.html), npm/pip/.. update commands)
    -   Policy for use of unmaintained/unsupported deps??
        -
-   Add project to snyk, enable GitHub security scans (Dependabot)
-   Include linting in CI
-   Cover AAI & input validation in unit tests
-   Handle snyk reports: <todo include link to flowchart>
-   Sign binaries & packages?
    -   [Support in package managers](https://blog.tidelift.com/the-state-of-package-signing-across-package-managers)

### Image development

-   Use up-to-date base images
-   Use up-to-date build script
-   Run docker security scan and linting in CI
    -   When can security scan be skipped/overridden/ignored
        -   Set allow\_failure: true in CI yaml config (GitLab)
        -   Pressure to get image out (e.g. RC -> stable release)
        -   Evaluate + document risk (create ticket)
        -   Pipeline conf change to security scan should be immediately reverted in branch or not merged
-   Run services as users with minimal permissions (do not leave as or set to root)
    -   Make such a  user in docker file and set it in supervisor config
-   Make configuration files read-only
-   Make application code read-only
-   Verify hash + signatures if available of downloaded binaries
-   Verify signatures of static executed files at runtime if possible
    -   e.g. signed hash of python code
-   Sign images??

### Compose project development

-   Only use images that have been checked for vulnerabilities (i.e. based on recent CLARIN base images)
-   Run security check in CI (not yet implemented)
-   Network configuration
    -   Don’t bind host to port if not needed (rarely needed)
        -   Make overlay for development if necessary (rather than commented out lines)
    -   Allow access beyond internal networks only if necessary. Use the ‘internal’ option of the network configuration, which creates an ​​externally isolated overlay network (see [Compose file version 3 reference](https://docs.docker.com/compose/compose-file/compose-file-v3/#internal))
        -   e.g. database containers generally do not need to be able to access anything or be accessed by anything on the internet
-   Volumes & mounts
    -   Don’t mount docker socket into container
    -   If possible avoid host mounts
        -   If needed, make read-only
        -   If needed, make a specific/minimal as possible
        -   Alternative solution: operation within container (e.g. on volume) and pull (copy) out of container or push out
        -   If needed for development, define in overlay
