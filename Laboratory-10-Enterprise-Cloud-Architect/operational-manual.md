# CLOUDNOVA Operational Manual

**Audience:** Client IT Team (handover document)
**System:** WordPress + MySQL 8.0 on Docker Compose, Ubuntu Server VM
**Author:** cbadongen | **Course:** CCM101 – Laboratory 10: Enterprise Cloud Architect

---

## 1. Executive Summary

CLOUDNOVA is a persistent, two-tier web application: a **WordPress** front end and a **MySQL 8.0** database, each running in its own Docker container on a single Ubuntu Server VM. Data survives restarts and re-deployments through named Docker volumes. The host is hardened with a default-deny UFW firewall, and a scheduled Bash script produces verified daily backups with 7-day retention.

| Item | Value |
|---|---|
| Hypervisor | VirtualBox |
| OS | Ubuntu Server (LTS) |
| Runtime | Docker Engine + Docker Compose plugin |
| Web tier | `wordpress:latest` → host port **8080** |
| Data tier | `mysql:8.0` (internal network only, not exposed) |
| Persistence | Volumes `wp_db_data`, `wp_site_data` |
| Stack directory | `~/wp-stack` |
| Backups | `~/wp-stack/backups` (daily 2:00 AM, 7-day retention) |

## 2. Architecture

```
 Admin PC (Windows)                    Ubuntu Server VM (VirtualBox)
┌────────────────┐   SSH :2222→22   ┌──────────────────────────────────────┐
│ PowerShell     │ ───────────────► │ UFW (deny incoming; allow 22, 8080)  │
│ Browser        │   HTTP :8080     │  ┌───────────────┐  ┌─────────────┐  │
└────────────────┘ ───────────────► │  │ cloudnova-wp  │─►│ cloudnova-db│  │
                                    │  │ WordPress :80 │  │ MySQL :3306 │  │
                                    │  └──────┬────────┘  └──────┬──────┘  │
                                    │   wp_site_data         wp_db_data    │
                                    │      (volume)           (volume)     │
                                    │  Docker network: backend (bridge)    │
                                    └──────────────────────────────────────┘
```

Key design decisions:
- **MySQL is never published to the host.** Only WordPress can reach it over the private `backend` network.
- **Named volumes** keep data independent of container lifecycle.
- **Secrets live in `.env`**, not in `docker-compose.yml`, and `.env` is git-ignored.
- `restart: unless-stopped` brings the stack back automatically after a reboot.

## 3. Prerequisites

- Ubuntu Server VM with at least 2 GB RAM, 2 vCPU, 20 GB disk
- VirtualBox NAT port forwarding:

| Name | Host Port | Guest Port |
|---|---|---|
| SSH | 2222 | 22 |
| WordPress | 8080 | 8080 |

- A non-root user with `sudo` privileges

## 4. Deployment

### 4.1 Install Docker

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker $USER   # log out/in after this
```

### 4.2 Fetch the stack

```bash
git clone https://github.com/<username>/CCM101-cbadongen.git
mkdir -p ~/wp-stack
cp CCM101-cbadongen/Laboratory-10-Enterprise-Cloud-Architect/{docker-compose.yml,automation-script.sh,.env.example} ~/wp-stack/
cd ~/wp-stack
chmod +x automation-script.sh
```

### 4.3 Configure secrets

```bash
cp .env.example .env
nano .env          # set strong, unique passwords
chmod 600 .env
```

### 4.4 Launch

```bash
docker compose up -d
docker compose ps
```

Open `http://localhost:8080` and complete the WordPress installer (site title: **CLOUDNOVA**).

### 4.5 Verify

```bash
./automation-script.sh health
```

All lines should show `OK`.

## 5. Security Hardening

### 5.1 Firewall (UFW, default deny)

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp      # SSH
sudo ufw allow 8080/tcp    # WordPress
sudo ufw enable
sudo ufw status verbose
```

> **Order matters:** allow port 22 **before** `ufw enable`, or you will lock yourself out of SSH.

> **Docker caveat:** Docker publishes ports by editing iptables directly, which can bypass UFW rules for *published* ports. This is why the database port is deliberately **not published** in `docker-compose.yml`.

### 5.2 Hardening checklist

| Control | Action |
|---|---|
| Secrets | `.env` is `chmod 600` and in `.gitignore` |
| SSH | Use key authentication; set `PasswordAuthentication no` and `PermitRootLogin no` in `/etc/ssh/sshd_config`, then `sudo systemctl restart ssh` |
| Least exposure | Only 22 and 8080 are open; DB is internal-only |
| Updates | `sudo apt update && sudo apt upgrade -y` monthly |
| WordPress | Strong admin password, remove unused plugins/themes, keep core and plugins updated |
| Brute-force protection | Optional: `sudo apt install fail2ban` |
| Image pinning | For production, pin `wordpress` to a specific version tag instead of `latest` |

### 5.3 Verification

```bash
sudo ufw status verbose          # default: deny (incoming)
sudo ss -tulpn | grep -E '3306|8080'   # 3306 must NOT be bound to the host
```

## 6. Backup & Recovery

All automation lives in `automation-script.sh`.

### 6.1 What is backed up

| Artifact | File pattern |
|---|---|
| MySQL database (compressed dump) | `db_<timestamp>.sql.gz` |
| WordPress files (themes, plugins, uploads, wp-config) | `wp_files_<timestamp>.tar.gz` |

Each backup is integrity-checked (`gzip -t`, `tar -tzf`) and backups older than 7 days are pruned.

### 6.2 Manual backup

```bash
./automation-script.sh backup
./automation-script.sh list
```

### 6.3 Scheduled backup (cron)

```bash
crontab -e
```

Add:

```cron
0 2 * * * /home/<user>/wp-stack/automation-script.sh backup >> /home/<user>/wp-stack/backups/cron.log 2>&1
```

Verify:

```bash
crontab -l
tail -n 20 ~/wp-stack/backups/cron.log
```

### 6.4 Restore

```bash
./automation-script.sh list
./automation-script.sh restore 2026-10-21_020000
```

The script asks for confirmation (`yes`), stops WordPress, restores files and database, and restarts WordPress.

### 6.5 Disaster recovery (VM lost)

1. Rebuild VM and install Docker (Section 4.1).
2. Restore `docker-compose.yml`, `automation-script.sh`, and `.env` into `~/wp-stack`.
3. Copy backup files into `~/wp-stack/backups/`.
4. `docker compose up -d`, wait ~30 seconds for MySQL to initialize.
5. `./automation-script.sh restore <timestamp>`.
6. Re-apply UFW rules (Section 5.1).

> **Recommendation:** Copy `backups/` to off-VM storage (external disk or cloud bucket). Backups on the same VM do not protect against VM loss.

## 7. Routine Maintenance

| Frequency | Task | Command |
|---|---|---|
| Daily (auto) | Backup | cron → `automation-script.sh backup` |
| Weekly | Health check | `./automation-script.sh health` |
| Weekly | Review logs | `docker compose logs --tail=100` |
| Monthly | OS patches | `sudo apt update && sudo apt upgrade -y` |
| Monthly | Update containers | `docker compose pull && docker compose up -d` |
| Monthly | Clean old images | `docker image prune -f` |
| Quarterly | **Test a restore** | `./automation-script.sh restore <timestamp>` on a test VM |

**Update procedure:** always run a backup first.

```bash
./automation-script.sh backup
docker compose pull
docker compose up -d
./automation-script.sh health
```

## 8. Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| "Error establishing a database connection" | DB still starting or wrong `.env` values | `docker compose logs db`; wait 30s; confirm `.env` matches |
| Site unreachable at `:8080` | Container down, UFW, or VirtualBox forwarding | `docker compose ps`; `sudo ufw status`; check port-forward rule |
| SSH refused after enabling UFW | Port 22 not allowed | Use VM console: `sudo ufw allow 22/tcp` |
| Containers gone after reboot | Docker not enabled at boot | `sudo systemctl enable docker` |
| Backup script fails on `.env` | Wrong `STACK_DIR` | Run from `~/wp-stack` or set `STACK_DIR` |
| Disk full | Old backups/images | `docker system df`; lower `RETENTION_DAYS`; `docker image prune -f` |
| Cron not running | Bad path or missing exec bit | Use absolute path; `chmod +x automation-script.sh`; check `cron.log` |

Useful commands:

```bash
docker compose ps
docker compose logs -f wordpress
docker compose restart wordpress
docker compose exec db mysql -u root -p
docker volume ls
```

## 9. Repository Contents

| File | Purpose |
|---|---|
| `README.md` | Lab overview and quick start |
| `architecture-diagram.png` | Visual architecture |
| `docker-compose.yml` | Stack definition |
| `.env.example` | Secret template (copy to `.env`) |
| `automation-script.sh` | Backup, restore, health check |
| `operational-manual.md` | This document |
| `final-reflection.md` | Mission 1–10 reflection |

## 10. Handover Checklist

- [ ] Stack running, `health` shows all OK
- [ ] UFW active, default deny, only 22 and 8080 allowed
- [ ] `.env` secured (`chmod 600`) and not in Git
- [ ] Cron job installed and a backup file exists
- [ ] Restore tested at least once
- [ ] Client IT team has SSH access and this manual
