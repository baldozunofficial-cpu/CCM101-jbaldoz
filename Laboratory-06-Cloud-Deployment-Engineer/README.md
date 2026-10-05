# Laboratory 06: Cloud Deployment Engineer

## Mission Overview
Deployed a two-tier private cloud using Docker Compose: a MariaDB database container and a Nextcloud application container, defined in a single YAML file.

## Objectives
- Document a two-tier architecture
- Write a docker-compose.yml for a multi-container stack
- Deploy and verify the stack, and access Nextcloud through the browser
- Shut down the infrastructure cleanly

## Commands Executed
- `mkdir nextcloud-deployment` and `cd nextcloud-deployment`
- `nano docker-compose.yml` (or `cat > docker-compose.yml`)
- `docker-compose up -d`
- `docker-compose ps`
- `docker-compose down`

## Skills Learned
- Writing YAML infrastructure code
- Multi-container deployment with Docker Compose
- Service networking using service names as hostnames
- Passing configuration through environment variables
