# Docker Compose Guide
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

  
## What does the `services:` block do?
The `services:` block defines each container that makes up the application. Every entry under it (here, `database` and `app`) is one service, with its own image, ports, and environment variables. Docker Compose reads this block and creates and connects all of the containers from a single file.

## How does the Nextcloud app container find the database container?
Through the `MYSQL_HOST=database` environment variable. Compose puts all services on a shared network and uses each service name as a hostname, so `database` resolves to the MariaDB container's address. This is why the database does not need a published port.

## What is the difference between `docker run` (Mission 4) and `docker-compose up -d`?
`docker run` starts one container at a time, and you must type out every option (image, ports, environment variables) each time. `docker-compose up -d` reads a YAML file and starts the whole multi-container stack together, with networking set up automatically. The `-d` flag runs everything in the background. The YAML file is also repeatable and can be saved in version control.
