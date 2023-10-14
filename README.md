## Redis Service

This Acorn provides a Redis database as an Acorn Service. This Acorn can be used to create a database for your application during development. It runs a single Redis container backed by a persistent volume. It also generates a password for the default admin user.

The Acorn image of this service is hosted in the GitHub container registry: *ghcr.io/lucj/acorn-redis*

## Usage

In the examples folder you can find a sample application using this serivce. It consists in a Python backend based on the FastAPI library.