# Testing

## Automated testing

- General
   - Unit testing
   - Integration testing (at (sub)service or application level)
   - UI testing
      - Types / purposes
         - Functionality, workflow
         - Browser compatibility
            - Guidelines for desired/required support
      - & CI
         - Use dedicated platform for this (Sauce Labs)
         - [https://docs.travis-ci.com/user/gui-and-headless-browsers/](https://docs.travis-ci.com/user/gui-and-headless-browsers/)
         - When to run? Takes relatively long, so not needed on every push but
         e.g. on a regular schedule and tags
      - Technology
         - Selenium
         - Puppeteer (Node, Chromium only)
   - Test coverage
- What to test where (and when)?
   - Application
      - Unit tests for class and methods
   - Docker
      - Create minimal ‘mock’ context + configuration in compose project
      - Test HTTP responses
         - If no HTTP interface?
            - “Mix in” HTTP interface (see e.g. [Postgres image](https://gitlab.com/CLARIN-ERIC/docker-postgres/-/tree/1.3.0/test))
   - Compose
      - Final integration
         - Provide test configuration, clean state
         - Bring everything up (using control script)
         - Verify that everything is up
         - Verify that everything goes down properly
      - Test backup and restore (with mock data)
      - Other custom control commands
      - All overlays

### Acceptance testing

- Testing -> Staging -> Production process
   - Alpha testing
      - Involve other developers
   - Beta testing
      - Who does it? What is the procedure??
      - At least one week of beta testing, scheduled tasks (backups,
      synchronisations, data ingest, indexation, cleanups...) should be able to
      run at least twice
      - Guideline: find representative(s) of target audience to “try it out” and
      give feedback
         - Ideally more and less experienced/informed users
         - Test both new features and existing features (to find regressions)
         - Announce on eric-tech; centre news; ... test channel on slack
      - Guideline: Define minimal test plan and have someone else walk through it
      - Guideline: include easy feedback mechanism (e.g. mopinion)
         - can stay in production but should not be intrusive
         - Should minimally have a simple free text report option
         - Optionally **also** a guided feedback form
