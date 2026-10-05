# Docker Compose Guide
services:
  db:
    image: mysql:8.0
    container_name: mysql-db
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
      MYSQL_DATABASE: appdb
      MYSQL_USER: appuser
      MYSQL_PASSWORD: apppass
    volumes:
      - db_data:/var/lib/mysql

  app:
    build: .
    container_name: web-app
    ports:
      - "5000:5000"
    environment:
      MYSQL_HOST: db
      MYSQL_DATABASE: appdb
      MYSQL_USER: appuser
      MYSQL_PASSWORD: apppass
    depends_on:
      - db

volumes:
  db_data:
  
## What does the `services:` block do?
The `services:` block defines each container that makes up the application. Every entry under it (here, `database` and `app`) is one service, with its own image, ports, and environment variables. Docker Compose reads this block and creates and connects all of the containers from a single file.

## How does the Nextcloud app container find the database container?
Through the `MYSQL_HOST=database` environment variable. Compose puts all services on a shared network and uses each service name as a hostname, so `database` resolves to the MariaDB container's address. This is why the database does not need a published port.

## What is the difference between `docker run` (Mission 4) and `docker-compose up -d`?
`docker run` starts one container at a time, and you must type out every option (image, ports, environment variables) each time. `docker-compose up -d` reads a YAML file and starts the whole multi-container stack together, with networking set up automatically. The `-d` flag runs everything in the background. The YAML file is also repeatable and can be saved in version control.
