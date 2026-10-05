# Docker Compose Guide

## The docker-compose.yml File

```yaml
version: "3"

services:
  database:
    image: mariadb:10.6
    environment:
      - MYSQL_ROOT_PASSWORD=cloudnova_root
      - MYSQL_PASSWORD=cloudnova_pass
      - MYSQL_DATABASE=nextcloud_db
      - MYSQL_USER=nextcloud_user

  app:
    image: nextcloud
    ports:
      - 8080:80
    environment:
      - MYSQL_PASSWORD=cloudnova_pass
      - MYSQL_DATABASE=nextcloud_db
      - MYSQL_USER=nextcloud_user
      - MYSQL_HOST=database
```

## What does the `services:` block do?

The `services:` block declares the containers that together make up my cloud setup. In this file there are two entries, `database` (MariaDB) and `app` (Nextcloud), and each one carries its own image, port mapping, and environment variables. Compose reads the block and builds a container from every entry, which means the whole stack is defined in one place.

## How does the Nextcloud container know where the database is?

It uses the `MYSQL_HOST=database` environment variable. Compose places every service on a shared network and registers each service name as a hostname, so `database` resolves to the MariaDB container automatically. That is why the app never needed an IP address, and why the database only exposes port 3306 inside the network instead of publishing it to the outside.

## What is the difference between `docker run` and `docker-compose up -d`?

With `docker run` I start a single container and must supply all its options on the command line each time. For a two-container stack, that means two long commands plus setting up the network between them by hand. `docker-compose up -d` reads the YAML file and brings up both containers, already connected, in one step. The `-d` flag detaches them so they run in the background. Because the settings live in a file, the deployment can be repeated exactly and saved in Git.

