# General
<!--
[Reference to operational section(s) on Docker (compose)]
Docker version
Docker compose version
Implementation of custom logic in compose project
subcommands
custom start/stop
backup and restore
Developing for use outside CLARIN infra context
"bundle" control script submodule
Name for projects/repositories -> image [TODO: discuss!]
Strategy for base images
Strategy for application images
-->

# Code style
<!--
Dockerfiles
CLARIN docker best practices
Use tag + digest for base image
Differences from docker best practices
https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
https://docs.docker.com/get-started/09_image_best/
Base images
For each main process
Supervisord setup
Fluentd setup
See Logging
Logrotate setup
Default healthcheck
How to customise
[Entrypoint]
Supervisor base images
Other cases
[Initialisation logic]
‘Core’ application directory
Choice of directory for stand-alone applications
If the environment or other context (e.g. tomcat) provides a requirement or guideline, follow that
If the choice is arbitrary, recommended locations
follow OS conventions (typically alpine)
for binaries
/usr/local/bin
for application bundles??
last WORKDIR in Dockerfile must be set to this directory
Compose projects
.env file/variables


Overlays
Use cases
When not to use -> when variables can do the trick
Custom scripts should hide complexity
Volumes & networks
Internal & external
-->

# Frameworks
<!--
Build script
https://gitlab.com/CLARIN-ERIC/build-script
Testing
images
Build script --test argument  with docker-compose
compose projects
test with ??
docker-compose
-->

# Documentation
<!--
Image project
README
Reference base image
List the important application and configuration locations (paths) inside the image
List the user name(s) defined and used in the image
-->

# Build tools & Continuous Integration
<!--
Describe our gitlab CI integration with hadolint
Include examples
Gitlab Docker repository
-->

# Testing tools

## Static code analysis
<!--
Linting with hadolint
[scan]
-->

# Upstream proxies

Software projects (compose projects) should have an nginx in front of the application to work as the upstream server.  This is because we want:
1. The upstreams to be uniform so that in the future we can deploy client/server authentication between the proxy and the upstreams in a standard way
2. Non-standard webserver configurations that are specific to a certain applications (e.g. SNI), will be deployed in the application project itself. Avoiding split logic.
3. The application should respond to all their requests on the same upstream port. Again, wherever possible making the central proxy configuration unaware  of the need for different ports.
If possible this should apply to all applications meant to run behind our central proxy. (Maybe we can augment our compose project init code to add this nginx by default)

There may be multiple nginx services in the same compose project as a result. One would be the dedicated proxy service. This is a desirable situation.
