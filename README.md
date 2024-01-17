## Redis Database

Redis is an in-memory data store, used as a database, cache, and message broker. It supports various data structures such as strings, hashes, lists, sets, and more, offering high performance and wide-ranging versatility. More information on [https://redis.io](https://redis.io/).

## Redis as an Acorn Service

The Acornfile used to create a Redis based Acorn Service is available in the GitHub repository at [https://github.com/acorn-io/redis](https://github.com/acorn-io/redis). This service triggers the creation of a Redis database running in a single container which can easily be used by an application during development.

This Redis instance:

- is backed by a persistent volume
- uses a default (auto generated) password for the admin user

The Acorn image of this service is hosted in GitHub container registry at [ghcr.io/acorn-io/redis:v#.#.#-#](ghcr.io/acorn-io/redis).

Currently this Acorn does not have any configuration options, but some will be added later on like:

- the possibility to indicate the Redis version to use
- the size of the persistent volume

## Usage

The [examples folder](https://github.com/acorn-io/redis/tree/main/examples) contains a sample application using this Service. This app consists in a Python backend based on the FastAPI library, it displays a web page indicating the number of times the application was called, a counter is saved in the underlying Redis database and incremented with each request. The screenshot below shows the UI of the example application.

![UI](./examples/images/ui.png)

To use the Redis Service, we first define a *service* property in the Acornfile of the application:

```
services: db: {
  image: "ghcr.io/acorn-io/redis:v#.#.#-#"
}
```

Next we define the application container:

```
containers: app: {
 build: {
  context: "."
  target:  "dev"
 }
 consumes: ["db"]
 ports: publish: "8000/http"
 env: {
  REDIS_HOST: "@{service.db.address}"
  REDIS_PASS: "@{service.db.secrets.admin.token}"
 }
}
```

This container is built using the Dockerfile in the examples folder. Once built, the container consumes the Redis service using the address and admin password provided through dedicated variables:

- @{service.db.address}
- @{service.db.secrets.admin.token}

This example can be run with the following command (to be run from the *examples* folder)

```
acorn run -n app
```

After a few tens of seconds an http endpoint will be returned. Using this endpoint we can access the application and see the counter incremented on each reload of the page.

## Deploy the app to your Acorn Sandbox

Instead of managing your own Acorn installation, you can deploy this application in the Acorn Sandbox, the free SaaS offering provided by Acorn. Access to the sandbox requires only a GitHub account, which is used for authentication.

[![Run in Acorn](https://acorn.io/v1-ui/run/badge?image=ghcr.io+acorn-io+redis+examples:v%23.%23.%23-%23)](https://acorn.io/run/ghcr.io/acorn-io/redis/examples:v%23.%23.%23-%23)

An application running in the Sandbox will automatically shut down after 2 hours, but you can use the Acorn Pro plan to remove the time limit and gain additional functionalities.

## Disclaimer

Disclaimer: You agree all software products on this site, including Acorns or their contents, may contain projects and materials subject to intellectual property restrictions and/or Open-Source license (“Restricted Items”). Restricted Items found anywhere within this Acorn or on Acorn.io are provided “as-is” without warranty of any kind and are subject to their own Open-Source licenses and your compliance with such licenses are solely and exclusively your responsibility. [Redis](https://redis.io) is licensed under three clause BSD license which can be found [here](https://redis.io/docs/about/license/#three-clause-bsd-license) and Acorn.io does not endorse and is not affiliated with Redis. By using Acorn.io you agree to our general disclaimer here: <https://www.acorn.io/terms-of-use>.
