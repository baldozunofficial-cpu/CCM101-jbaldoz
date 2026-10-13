# Backup Script Guide

## Full Script (backup.sh)

```bash
#!/bin/bash
# Automated Backup Script for CloudNova Technologies

SOURCE_DIR="app-data"
BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

echo "Initiating automated backup..."

# Create the backup directory if it does not exist
mkdir -p $BACKUP_DIR

# Compress the source directory into a tarball (.tar.gz)
tar -czf $BACKUP_DIR/backup_$TIMESTAMP.tar.gz $SOURCE_DIR

echo "Backup completed successfully at $TIMESTAMP!"
```

## What `chmod +x` Does
By default, Linux treats a new file as plain text and will not let it run as a
program, which is why my first `./backup.sh` gave "Permission denied". The
command `chmod +x backup.sh` adds the execute permission to the file, so the
system now allows it to run as a program.

## Cron Expression

```
0 2 * * * cd /root/CCM101-jbaldoz && ./backup.sh
```

| Field | Value | Meaning |
|-------|-------|---------|
| Minute | `0` | At minute 0 (the top of the hour) |
| Hour | `2` | At 2 AM (24-hour clock) |
| Day of Month | `*` | Every day of the month |
| Month | `*` | Every month |
| Day of Week | `*` | Every day of the week |

Together, this runs the backup every night at exactly 2:00 AM. The
`cd /root/CCM101-jbaldoz &&` part moves into the script's folder first, because
the script uses relative paths (`app-data` and `backups`).
