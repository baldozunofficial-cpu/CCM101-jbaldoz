# Firewall Configuration

This document records the commands used to secure the Ubuntu server with UFW (Uncomplicated Firewall).

## 1. Allow SSH
```bash
sudo ufw allow ssh
```
This permanently allows SSH (port 22) so administrators can still manage the server.

## 2. Set the Default Deny Policy
```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```
All incoming traffic is blocked by default, while all outgoing traffic is allowed.

## 3. Enable the Firewall
```bash
sudo ufw enable
sudo ufw status verbose
```

## 4. Allow Port 8080
```bash
sudo ufw allow 8080/tcp
sudo ufw status numbered
curl localhost:8080
```
This creates a specific rule so legitimate web users can reach the Nginx container on port 8080.

## What would happen if `sudo ufw enable` ran before `sudo ufw allow ssh`?
The firewall would start with a default deny incoming policy and no rule for port 22, so the SSH connection would be blocked and I would be locked out of my own server.
