## Redis Database

Redis is an in-memory data store, used as a database, cache, and message broker. It supports various data structures such as strings, hashes, lists, sets, and more, offering high performance and wide-ranging versatility. More information on [https://redis.io](https://redis.io/).

## Redis as an Acorn Service

This Acorn provides a Redis database as an Acorn Service.  It can be used to easily get a Redis database for your application during development. The current service runs a single Redis container backed by a persistent volume and define a password for the default admin user.

## Acorn image

The Acorn image of this service is hosted in GitHub container registry: *ghcr.io/acorn-io/redis*

## Service configuration options

Currently this Acorn does not have any configuration options, but some could be added later on if needed.

## Usage

In the examples folder you can find a sample application using this Service. It consists in a Python backend based on the FastAPI library which returns the number of times the application was called. This incremental value is saved in the underlying Redis database and incremented with each request.

This example can be run with the following command (make sure to run it from the *examples* folder)

```
acorn run -n api
```

After a few tens of seconds you will be returned an http endpoint you can use to acces the application.

Using this endpoint we can access the application and see the counter (which value is persisted in the Redis underlying database) been incremented.

![UI](./images/ui.png)

## Deploy to the sandbox

Instead of managing your own Acorn installation, you can easily deploy this application in the Acorn Sandbox, which is the free SaaS offering provided by Acorn. The only pre-requisite before doing so is to make sure you have a GitHub account as this is the one used to authenticate in the Sandbox.

When running in the Sandbox, an application will be automatically shutdown after 2 hours. If you need your app to keep running, you may consider to upgrade to the Acorn Pro plan.