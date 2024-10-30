# API development

## Component separation

Separation from other components: 
* 👉 `MUST` be physically separated code (same repository is OK)
* 👉 `SHOULD` be separate (e.g. Maven) project
* 👉 `SHOULD` be deployed separately from front end, server side jobs (not in same image)
* 👉 API `SHOULD` serve both front-end `AND` serve external (public) usage purpose -  try to share resources as much as possible
* 👉 Front-end `MUST` consume the API 

## Current container architecture approaches in CLARIN ERIC infrastructure

### Approach LRS

* Back end/API (Dropwizard) + integrates front end
* Nginx Proxy
* Easier build, responsibility/guarantee for front end and back end  compatibility at build stage
* Cannot separately deploy/test back end or front end 

### Approach Component Registry

* Back end/API (JAX-RS) + wicket for administration interface in Tomcat
* Nginx: static front end content + proxy to back end
* Two custom images, front end and back end can be managed separately

### Centre registry (legacy approach for Django applications)

* One image
* Single app: APIs, front-end (server side rendering), static resources
* Two different APIs (json, XML)
* Front-end does not consume API 

### Digital Object Gateway (new approach for Django applications)

* One image
* APIs and server side front-end as separate Django reusable applications
* Front-end consumes API

### OAI viewer

* Dreamfactory API & react front end in one image

## REST

REST architecture means following the 5(+1) Guiding Principles of [REST](https://restfulapi.net)
OpenAPI specification. [Designing APIs with Swagger and OpenAPI](https://www.manning.com/books/designing-apis-with-swagger-and-openapi)

### REST corner cases

[RESTful Web APIs](https://learning.oreilly.com/library/view/restful-web-apis/9781449359713/)

* Older: 
* * processing
* * resources / suggestions?
* Search
* * normally (or often) a filter on a resource
* * resources / suggestions?

### Versioning

[RESTful API Versioning](https://restfulapi.net/versioning/)

* 👉 `MUST` Apply versioning from the start
* 👉 Semantic versioning: breaking changes `MUST` lead to new major version
* 👉 `MUST` keep version in URL path, keep it explicit (no default)
* 👉 Old versions do not have to be supported

### Documentation

* 👉 `MUST` provide OpenAPI for technical documentation/specification
* 👉 If public facing `MUST` add manual / describe in README
