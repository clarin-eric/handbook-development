# API development

## REST

REST architecture means following the 5(+1) Guiding Principles of REST (https://restfulapi.net) [OpenAPI specification](https://www.manning.com/books/designing-apis-with-swagger-and-openapi)

## Logic separation

API logic should be encapsulated and separate from the application backend. It can be stored in the same repository.
👉 Front-end `SHOULD` consume API in order to maximise reusability. 

## Versioning

👉 `MUST` apply versioning from the start. Semantic versioning: breaking changes should lead to new major version.
“APIs only need to be up-versioned when a breaking change is made.”. 
👉 `MUST` include cersion tag in URL path, `SHOULD` be explicit (no default)
👉 `MUST` expose endpoint with OpenAPI documentation
👉 Public facing API `MUST` provide manual/documentation in README

## Examples of current container architecture approaches

CLARIN ERIC currently deploys applications with API in three approaches:

### LRS

- back-end/API (Dropwizard) + integrated front-end.  
- nginx proxy

Easy to build, compatibility ensured at build stage
Cannot separately deploy/test back- or front-end

### Component Registry

- back-end/API \(JAX-RS\) + wicket for administration interface in Tomcat
- nginx proxy + front-end's statics

Two separate images, front- and back-end can be managed separately. 

### Centre Registry

- one image with monolitic Django application
- server-side front-end
- two different APIs (json, XML)
- front-end does not consume API

### Digital Object Gateway

- one image bundling Django's front-end and back-end reusable applications
- deployed in the same container, could be distributed
- front-end does consume API

### OAI viewer

- Dreamfactory API + React front-end in one image
