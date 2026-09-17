# Docker Deployment

## Container Lifecycle Commands

| Command | What It Did |
|---|---|
| `docker ps` | Lists all currently running containers, showing their ID, image, status, and port mappings. |
| `docker stop my-nginx` | Gracefully stops the running `my-nginx` container by sending it a shutdown signal. |
| `docker ps -a` | Lists all containers (running and stopped), used here to confirm `my-nginx` had an "Exited" status after being stopped. |
| `docker rm my-nginx` | Permanently removes the stopped `my-nginx` container from the system, deleting its writable layer and freeing its name. |
