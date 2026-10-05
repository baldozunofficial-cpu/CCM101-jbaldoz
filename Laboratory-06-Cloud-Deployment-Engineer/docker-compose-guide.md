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

The `services:` block is where I list every container my application needs. Each entry under it, like `database` and `app`, is one service with its own image, ports, and environment variables. When I run Compose, it reads this block and starts one container for each service, so I don't have to start them one by one.

## How did the app container find the database?

The app container found the database by using the name `database`. Compose puts all the services on the same network, and each service name works like a hostname. In the app service I set `MYSQL_HOST=database`, so when Nextcloud tries to connect to `database`, Docker points it to the MariaDB container. I never had to type an IP address, which is useful because container IPs can change.

## docker run vs docker-compose up -d

`docker run` starts only one container, and I have to type every option myself (image, ports, environment variables, network). With two or more containers, that gets long and easy to get wrong. `docker-compose up -d` starts everything in the file with a single command, and the `-d` runs it in the background so I can still use my terminal. It's also easier to repeat because the whole setup is saved in the file.
