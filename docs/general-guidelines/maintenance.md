# Maintenance

Project statuses

- Prototype
- Active development
- Maint
- Deprecated - deployed
- Deprecated - undeployed

<table>
  <tbody>
    <tr>
      <th>
        <p>Label</p>
      </th>
      <th>
        <p>Development</p>
      </th>
      <th>
        <p>Maintenance</p>
      </th>
      <th>
        <p>Deployed</p>
      </th>
      <th>
        <p>Notes</p>
      </th>
    </tr>
    <tr>
      <td>
        <p>A</p>
      </td>
      <td>
        <p><strong>+</strong></p>
      </td>
      <td>
        <p><strong>+</strong></p>
      </td>
      <td>
        <p>-</p>
      </td>
      <td>
        <p>Prototyping to first RC</p>
      </td>
    </tr>
    <tr>
      <td>
        <p>B</p>
      </td>
      <td>
        <p><strong>+</strong></p>
      </td>
      <td>
        <p><strong>+</strong></p>
      </td>
      <td>
        <p><strong>+</strong></p>
      </td>
      <td>
        <p>Matur(ing), in use</p>
        <p>At least one stable release</p>
      </td>
    </tr>
    <tr>
      <td>
        <p>C</p>
      </td>
      <td>
        <p>-</p>
      </td>
      <td>
        <p><strong>+</strong></p>
      </td>
      <td>
        <p><strong>+</strong></p>
      </td>
      <td>
        <p>Stable, feature frozen</p>
      </td>
    </tr>
    <tr>
      <td>
        <p>D</p>
      </td>
      <td>
        <p>-</p>
      </td>
      <td>
        <p>-</p>
      </td>
      <td>
        <p><strong>+</strong></p>
      </td>
      <td>
        <p>Abandoned, in use</p>
      </td>
    </tr>
    <tr>
      <td>
        <p>E</p>
      </td>
      <td>
        <p>-</p>
      </td>
      <td>
        <p>-</p>
      </td>
      <td>
        <p>-</p>
      </td>
      <td>
        <p>Dead</p>
      </td>
    </tr>
  </tbody>
</table>

Definitions

- Development
   - There is a development roadmap specific to the dev project
   - Has at least one responsible developer assigned
- Maintenance
   - Has at least one responsible maintainer assigned
      - Responsible for monitoring code base in terms of vulnerabilities, functional breakages
      - Responsible for addressing (at the very least) critical issues in the code base
   - Example activities covered
      - Dependency / base image updates
      - Implement required adaptations to new or changed context (OS, runtime, servlet container, ...)

<table>
<tbody>
  <tr>
    <th>
      <p>Status</p>
    </th>
    <th>&nbsp;</th>
    <th>
      <p>Project examples</p>
    </th>
  </tr>
  <tr>
    <td>
      <p>A</p>
    </td>
    <td>
      <p>Prototyping - first RC</p>
    </td>
    <td>
      <p>VCR JS widget</p>
      <p>VLO 5.0</p>
      <p>DOG</p>
    </td>
  </tr>
  <tr>
    <td>
      <p>B</p>
    </td>
    <td>
      <p>Matur(ing), in use</p>
    </td>
    <td>
      <p>VLO</p>
      <p>VCR</p>
    </td>
  </tr>
  <tr>
    <td>
      <p>C</p>
    </td>
    <td>
      <p>Stable, feature frozen</p>
    </td>
    <td>
      <p>Switchboard</p>
      <p>Component Registry</p>
      <p>Centre Registry</p>
      <p>OAI-PMH Harvester, viewer</p>
      <p>RASA</p>
    </td>
  </tr>
  <tr>
    <td>
      <p>D</p>
    </td>
    <td>
      <p>Abandoned, in use</p>
    </td>
    <td>
      <p><a href="https://github.com/clarin-eric/SAML-metadata-checker/">SAML-metadata-checker</a></p>
      <p>earlier: FCS?</p>
    </td>
  </tr>
  <tr>
    <td>
      <p>E</p>
    </td>
    <td>
      <p>Dead</p>
    </td>
    <td>
      <p><a href="https://github.com/clarin-eric/clarin-horizon_drupal_theme">clarin-horizon_drupal_theme</a></p>
    </td>
  </tr>
</tbody>
</table>

\[TODO: guidelines matrix for status X aspect\]

Per project status:

- What drives releases?
   - A-B: roadmap
   - C: external factors, e.g. support for underlying technology, fixing of critical bugs and vulnerabilities
   - D-E: n/a
- Maintainer(s) - tasks and responsibilities
   - A-C MUST address critical security risks
   - CAN address other issues
      - enhancements and new functionality covered by developer role!
   - No maintainer (cat D, E) -> operational handbook
      - Possibility to (temporarily) address as C in short term
      - OR (temporarily) shut down
- Repository
   - Cat A-C: MUST be findable in Git repositories
   - D: SHOULD be in Git repository, MAY be in deprecated repository system
   - E: SHOULD be archived
- Issue reporting & tracking
   - A-B: known issues, envisioned features are documented in issue tracking system by developer/maintainer
      - may be for C as well but without commitment
   - A-B-C: maintainer will handle incoming issue reports via repository system
   - D-E: issue reporting is disabled
- Documentation
   - A: needs to have minimal documentation (needs to be defined) for development, deployment, testing purposes (up-to-date README file)
   - B-C: need to have up-to-date documentation both for development and operational purposes and end users; changelog
   - D-E: documentation needs to include statement about status of project
- Monitoring -> operational
   - B-C: needs permanent monitoring with alerting, log aggregation to ensure good health
   - D: included in general monitoring to ensure being alive
