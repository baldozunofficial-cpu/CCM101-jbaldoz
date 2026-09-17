# Docker Deployment

## Container Lifecycle Commands

| Command | What It Did |
|---|---|
| `docker ps` | Lists all currently running containers, showing their ID, image, status, and port mappings. |
| `docker stop my-nginx` | Gracefully stops the running `my-nginx` container by sending it a shutdown signal. |
| `docker ps -a` | Lists all containers (running and stopped), used here to confirm `my-nginx` had an "Exited" status after being stopped. |
| `docker rm my-nginx` | Permanently removes the stopped `my-nginx` container from the system, deleting its writable layer and freeing its name. |
<img width="949" height="225" alt="container-lifecycle" src="https://github.com/user-attachments/assets/3ce73c1e-8a19-41b0-8a4b-d321f9f78506" />
