# Laboratory 08 - Cloud Security Engineer

## Mission Overview
In this mission, I secured a Linux server running an Nginx web application by configuring the UFW firewall with a default deny policy and a specific rule for the web port.

## Objectives
- Explain core cloud security principles (Least Privilege, Attack Surface, Default Deny)
- Deploy a containerized Nginx web server on port 8080
- Enable and configure UFW on an Ubuntu server
- Allow only the required ports (SSH and 8080) while blocking everything else
- Document the configuration and upload evidence to GitHub

## Commands Executed
```bash
docker run -d --name secure-web-app -p 8080:80 nginx
docker ps
curl localhost:8080
sudo ufw allow ssh
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo ufw status verbose
sudo ufw allow 8080/tcp
sudo ufw status numbered
```

## Skills Learned
- Applying the Principle of Least Privilege and Default Deny in practice
- Managing host-based firewall rules with UFW
- Opening specific ports without exposing the whole server
- Running and verifying a Docker container
- Documenting technical work in Markdown and organizing a GitHub portfolio
