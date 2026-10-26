nano ~/wp-stack/backup.sh

#!/bin/bash
# backup.sh - Automated backup of CLOUDNOVA WordPress DB + files
set -euo pipefail

STACK_DIR="$HOME/wp-stack"
BACKUP_DIR="$HOME/backups"
LOG_FILE="$BACKUP_DIR/backup.log"
DATE=$(date +%F_%H-%M-%S)
RETENTION_DAYS=7
DB_SERVICE="db"
WP_SERVICE="wordpress"
DB_FILE="$BACKUP_DIR/db_$DATE.sql.gz"
WP_FILE="$BACKUP_DIR/wpfiles_$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"
cd "$STACK_DIR"

log() { echo "[$(date '+%F %T')] $1" >> "$LOG_FILE"; }
on_error() {
  log "ERROR: backup failed, removing incomplete files"
  rm -f "$DB_FILE" "$WP_FILE"
}
trap on_error ERR

log "Backup started"

# 1. Database dump (password galing sa container env, hindi sa command line)
docker compose exec -T "$DB_SERVICE" sh -c \
  'MYSQL_PWD="$MYSQL_ROOT_PASSWORD" mysqldump -uroot --all-databases' \
  | gzip > "$DB_FILE"
log "Database backup done: db_$DATE.sql.gz"

# 2. WordPress files
docker compose exec -T "$WP_SERVICE" tar czf - -C /var/www/html . \
  > "$WP_FILE"
log "WP files backup done: wpfiles_$DATE.tar.gz"

# 3. Delete backups older than 7 days
find "$BACKUP_DIR" -type f \( -name "*.sql.gz" -o -name "*.tar.gz" \) -mtime +$RETENTION_DAYS -delete
log "Old backups cleaned (older than $RETENTION_DAYS days)"

log "Backup finished successfully"

Step 3: Gawing executable

chmod +x ~/wp-stack/backup.sh
ls -l ~/wp-stack/backup.sh


Step 4: I-test manually

~/wp-stack/backup.sh
ls -lh ~/backups
cat ~/backups/backup.log