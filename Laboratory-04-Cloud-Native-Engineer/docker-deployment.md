# Docker Deployment Log

## Container Lifecycle Commands

1. **`docker ps`** — Lists all currently running containers, showing their ID, image, status, and port mappings.
2. **`docker stop my-nginx`** — Gracefully stops the running `my-nginx` container by sending it a shutdown signal.
3. **`docker ps -a`** — Lists all containers (running and stopped), used here to confirm `my-nginx` had an "Exited" status after being stopped.
4. **`docker rm my-nginx`** — Permanently removes the stopped `my-nginx` container from the system, deleting its writable layer and freeing its name.
<img width="949" height="225" alt="container-lifecycle" src="https://github.com/user-attachments/assets/3ce73c1e-8a19-41b0-8a4b-d321f9f78506" />
