# Java

## General

- Java versions
   - Recommended version -> aligned with production. LTS?
      - <https://www.oracle.com/java/technologies/java-se-support-roadmap.html>
   - Vendor(s)
      - openjdk \[Has to be supported by alpine, can change in the future\]

## Code style

- Formatting
   - Following the [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html)
   - Any deviations??
- (Anti-)patterns
   - TODO (requires reference & motivation) \[Guideline\]
      - Exception handling
         - In relation to closeable objects
      - Use of interfaces
      - Re-assigning variables (i.e. not final)
      - Mutable collections
      - Home brewing common but error prone algorithms
         - instead use library, typically guava
         - examples: parsing (csv), string manipulations, IO pipelines, ...
      - ...
- Design considerations for applications and services
   - OOP principles

## Frameworks & libraries

**Guideline**: for each of the categories in the table below, investigate the applicability of the library listed in the respective ‘guideline’ column before considering alternatives or implementing your own utilities.

<table>
  <thead>
    <tr>
      <th>
        <p dir="ltr"><strong>Category</strong></p>
      </th>
      <th>
        <p dir="ltr"><strong>Guideline&nbsp;</strong></p>
      </th>
      <th>
        <p dir="ltr"><strong>Remarks</strong></p>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        General utility:<br />
        Collections, Strings, IO, ..
      </td>
      <td>
        <p dir="ltr">
          <a href="https://github.com/google/guava">Guava</a><br />
          and/or<br />
          Apache Commons
        </p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        <p dir="ltr">Logging facade</p>
      </td>
      <td>
        <p dir="ltr">SLF4J</p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        <p dir="ltr">Log binding</p>
      </td>
      <td>
        <p dir="ltr">logback</p>
      </td>
      <td>
        <p dir="ltr">
          Log4j acceptable but considered legacy; migration to logback
          recommended
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p dir="ltr">CLI options</p>
      </td>
      <td>
        <p dir="ltr">
          <a href="https://commons.apache.org/proper/commons-cli/"
            >Apache Commons CLI</a
          >
        </p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        <p dir="ltr">Dependency injection</p>
      </td>
      <td>
        <p dir="ltr">Spring IoC</p>
      </td>
      <td>
        <p dir="ltr">Use general Java annotation (e.g. @javax.inject.Inject)</p>
      </td>
    </tr>
    <tr>
      <td>
        <p dir="ltr">Web application (server side)</p>
      </td>
      <td>
        <p dir="ltr"><a href="https://wicket.apache.org/">Apache Wicket</a></p>
        <p dir="ltr">Spring (WebMVC, thymeleaf)</p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        <p dir="ltr">Web service</p>
      </td>
      <td>
        <p dir="ltr"><a href="https://www.dropwizard.io/">Dropwizard</a></p>
        <p dir="ltr">Spring (WebMVC / WebFlux)</p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        <p dir="ltr">Testing</p>
      </td>
      <td>
        <p dir="ltr">JUnit</p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        <p dir="ltr">Mocking</p>
      </td>
      <td>
        <p dir="ltr">Mockito</p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>
        <p dir="ltr">XML testing</p>
      </td>
      <td>
        <p dir="ltr">
          <a href="https://github.com/xmlunit/xmlunit">XMLUnit</a>
        </p>
      </td>
      <td></td>
    </tr>
  </tbody>
</table>

## Documentation

- Javadoc
   - \[Which guideline?\]
   - Publication
- What to put in README
   - Java version
   - Build instructions

## Build tools & Continuous Integration

- Maven
   - Project structure
   - Versioning
   - Deploying to repository
      - \[Where to publish\]
- Gradle
   - Don’t use it \[Guideline\]
- Ant
   - Definitely don’t use it \[Guideline\]
   -

### Static code analysis

- Maven plugins
   - Code coverage
   - Static code analysis

## Further reading

Recommended books, articles etc:

[Google Java Style Guide](https://google.github.io/styleguide/javaguide.html)
