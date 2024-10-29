# Configuration

## What should be configurable and how?

- HOWs
   - Config file
   - App specific environment variable
   - Global system property (application inherits)
      - Potentially with override option
   - Database
   - External service
   - ...
- User & role management
   - Externalise all user, role, credentials information from code base
   - Normally there is no need for 'real' management of usernames and passwords; standard situation: db or back end service username/password; end users authenticate through SAML
   - Store roles (if applicable) in database, provided management interface
   - Storing passwords in plain text (i.e. not a hash, unencrypted) should be avoided
   - Having a property in the general configuration for e.g. defining admin user ids is an anti-pattern
   - There can be a property to 'bootstrap' users and roles, e.g. a 'master' admin
   -

## External configurability

- Means no (re-)build is needed to apply
- Reloading configuration
   - Hot reloadable preferable (can also be manually triggered through UI)
      - If application restart is required, make sure that active sessions don't get broken if at all possible - otherwise warn
- Docker (compose)
   - Wherever possible, provide defaults
      - Dockerfile
         -
      - Compose YAML file: "FOO: ${MY\_FOO:-default}"
         - In .env this allows for optional "MY\_FOO=bar"
   - Mandatory settings without a default
      - Docker image should also have logic to check for mandatory settings (use init script)
      - Compose YAML file: "FOO: ${MY\_FOO:?err}" or "${MY\_LOCAL\_DIRECTORY:?err}:/path/inside/container"
         - See [compose file documentation](https://docs.docker.com/compose/compose-file/compose-file-v3/#variable-substitution)
         - Particularly useful for mandatory volumes/mounts

## Parameters vs files

- Aim for lowest complexity
- Configuration parameters
   - Environment variables
- Configuration files
   - & docker images
      - mounting as file vs mount as directory
         - directory mount preferred as it can be modified without recreating the container
      - 'Core application' configuration & library/util configuration (logging, scheduling, auth, ...)
         - If one or more aspects of configuration are done through a mount (e.g. logging), configuration of this should be optional, i.e. provide a default
         - You can provide a way of overriding the core application config (that is normally filtered as a template) through a mount
   - & compose projects
      - directory (or optionally file) configurable through .env variable
   - Loading from external source
      - e.g. GitHub
         - Not a preferable method for application configuration, use conventions described above; suitable for other resources such as definitions (e.g. data mappings), display content (e.g. help page and other documentation, headers & footers) etc.
         - Provide a local caching mechanism - don't depend on availability of external resource in real time
            - use a local copy; e.g. in container environment load resource on container init
            - try to reload if applicable
            - warn if local copy is too old
         - Do a validation after retrieval/refresh, before updating cache
            - Syntax check
            - If there is any risk e.g. of vulnerability injection or vandalism, it can be mitigated with a signature check
   - Preferred format/serialization/syntax?
      - {Investigate}
         - Requirements:
            - allows comments
            - can be validated (schema?)
            - transformable

## Interactive management (e.g. configuration/admin panel)

- `<to be filled in>`

## Links

- <https://12factor.net/config>
