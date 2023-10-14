## Redis Service

This Acorn provides a Redis database as an Acorn Service. This Acorn can be used to create a database for your application during development.  
It runs a single Redis container backed by a persistent volume.  
It also generates a password for the default admin user.

The Acorn image of this service is hosted in the GitHub container registry: *ghcr.io/lucj/acorn-redis*

## Usage

In the examples folder you can find a sample application using this service. It consists in a Python backend based on the FastAPI library which returns the number of times the "/" routes has been called (this value is saved in Redis and increment for each request).

This example can be run with the following command (make sure to run it from the *examples* folder)

```
acorn run -n api
```

After a few tens of seconds you will be returned an http endpoint you can use to acces the application. 

For instance, using this endpoint we can send an HTTP Get request using cURL:

```
$ curl k8s-test3e3d-apppubli-58f1d9adf4-5081003c9ca93235.elb.us-east-2.amazonaws.com:8000
{"message":"Webpage viewed 1 time(s)"}
```