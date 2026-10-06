# Laboratory 07 - Cloud Operations Engineer

## Mission Overview

In this laboratory, I acted as a Cloud Operations Engineer responsible for monitoring a client's web server. I established a baseline of the host system's health, deployed an Nginx container, generated simulated user traffic, and then used logs and live metrics to observe how the application and its resources were behaving.

## Objectives

- Establish a baseline of the host server's memory, disk storage, and CPU load.
- Deploy an Nginx web server container and generate both successful and failed HTTP requests.
- Retrieve and interpret application logs to identify errors.
- Monitor real-time container resource usage with Docker's built-in tools.
- Document findings in a clear and organized GitHub repository.

## Monitoring Commands Executed

| Command | Purpose |
|---------|---------|
| `free -h` | Check the server's total and available memory (RAM) |
| `df -h` | Check disk storage and the root file system capacity |
| `top` | View running processes and live CPU load |
| `docker run -d -p 8080:80 --name client-website nginx` | Deploy the Nginx web server container |
| `curl http://localhost:8080` | Simulate successful user visits |
| `curl http://localhost:8080/hidden-admin-page` | Simulate a failed request (404 error) |
| `docker logs client-website` | Retrieve application logs from the container |
| `docker stats` | View live CPU, memory, and network usage of the container |

## Skills Learned

- Checking host server resources before and during deployment
- Deploying and running containers with Docker
- Generating test traffic with `curl`
- Reading application logs to troubleshoot errors
- Monitoring container metrics in real time
- Using Git and GitHub to document and submit lab work
