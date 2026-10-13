# Laboratory 09 - Cloud Automation Engineer

## Mission Overview
In this lab I played the role of a Cloud Automation Engineer for CloudNova
Technologies. My mission was to automate a nightly backup of client data using
a Bash script and a Linux cron job, then document the work for the IT team.

## Objectives
- Research Bash scripts, variables, and cron jobs
- Write a Bash script that compresses a folder into a timestamped backup
- Grant execute permission to the script with `chmod`
- Schedule the script to run automatically at 2:00 AM using cron
- Document the script and reflect on automation

## Commands Executed
- `mkdir app-data` and `echo "..." > app-data/data.txt` - created dummy client data
- `nano backup.sh` - wrote the backup script
- `./backup.sh` - ran the script (denied at first, worked after chmod)
- `chmod +x backup.sh` - made the script executable
- `ls -l backups/` - verified the .tar.gz backup was created
- `crontab -l` - listed scheduled cron jobs
- `env EDITOR=nano crontab -e` - opened the cron editor
- `git add`, `git commit`, `git push` - saved my work to GitHub

## Skills Learned
- Writing and running Bash scripts
- Using variables and command substitution in scripts
- Managing Linux file permissions with chmod
- Compressing files with tar
- Scheduling tasks with cron
- Documenting technical work for a team
