# Laboratory 04 - Cloud-Native Engineer

## Mission Overview
This lab covers the fundamentals of containerization as an alternative to traditional
virtual machines. The mission involved researching the differences between VMs and
containers, deploying an Nginx web server using Docker, and managing the full
lifecycle of a running container.

## Objectives
- Understand the architectural differences between Virtual Machines and Containers
- Verify a Docker environment is correctly installed and running
- Pull and deploy a containerized web server (Nginx) from Docker Hub
- Practice the container lifecycle: run, stop, verify, and remove
- Document technical work in a clear, professional format

## Docker Commands Executed

**Checkpoint 3 - Verifying Docker**
- `docker --version` — Displays the installed Docker version.
- `docker info` — Shows detailed status of the Docker environment (containers, images, storage driver, etc.).

**Checkpoint 4 - Deploying Nginx**
- `docker pull nginx` — Downloads the official Nginx image from Docker Hub.
- `docker run -d -p 8080:80 nginx` — Runs the Nginx container in detached mode, mapping host port 8080 to container port 80.
- `curl http://localhost:8080` — Sends an HTTP request to confirm the web server is responding.

**Checkpoint 5 - Container Lifecycle**
- `docker ps` — Lists all currently running containers.
- `docker stop <container_id>` — Stops the running Nginx container.
- `docker ps -a` — Verifies the container's status is now "Exited."
- `docker rm <container_id>` — Permanently removes the stopped container.

## Skills Learned
- How to pull and run container images from Docker Hub
- How port mapping connects a container's internal port to the host machine
- How to manage the full lifecycle of a container (start, stop, verify, remove)
- How to use Git and GitHub to version and push project documentation
- How containerization streamlines deployment compared to traditional VM setup

## Challenges Encountered
- Ran into GitHub authentication issues when pushing changes, since password
  authentication is no longer supported — resolved by generating and using a
  Personal Access Token (PAT) instead.
- Had to double-check working directory paths (`cd`) to make sure Git commands
  were run from inside the correct repository folder.
