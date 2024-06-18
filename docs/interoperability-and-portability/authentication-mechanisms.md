# Authentication mechanisms

-   Shibboleth
    -   Use library (Java: shhaa filter - [https://github.com/clarin-eric/mpgaai](https://github.com/clarin-eric/mpgaai))
    -   Other cases: depend on headers (taken care of by central proxy)
    -   Developing a shibbolized application
        -   Local development: normally it should be sufficient to have swappable auth configuration (e.g. basic auth & saml)
        -   Testing
            -   Not easy to test until first deployment in a prepared (by sysops) environment
            -   Easiest would be with test environment (sandboxed with IdP and SP, proxy); deployment method is a question
                -   Not available right now!
-   API authentication
    -   Browser based API access
        -   UI served from same server - user can authenticate, API can be used through same session
    -   Non-browser based
        -   Token based
            -   Token has to be requested in shibbolized session
-   Other auth mechanism
    -   Support basic auth for testing, other deployments
