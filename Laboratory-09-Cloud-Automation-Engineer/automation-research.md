# Automation Research

## Bash Script
A Bash script is a plain text file containing a list of Linux commands that run
one after another, so you don't have to type them by hand each time. The first
line, `#!/bin/bash` (the shebang), tells the system which program (the Bash
shell) should read and run the rest of the file.

## Variables
Variables store a value (like a folder path) under a name, so you can reuse it
throughout a script. If the path changes, you only update it in one place
instead of hunting through every line, which prevents typos and mistakes. It
also makes the script easier to read and reuse.

## Cron Job
A cron job is a task that Linux runs automatically on a schedule, such as every
night at 2:00 AM, using the cron scheduler. It's essential in cloud operations
because routine work like backups, log cleanup, and updates happens reliably
without a human having to remember or be online to do it.
