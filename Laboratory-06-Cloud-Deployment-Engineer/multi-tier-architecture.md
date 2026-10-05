# Multi-Tier Architecture

A Two-Tier Architecture splits an application into a presentation/logic layer and a data layer, each running independently.

## The Web/Application Tier
This tier is what users interact with. It serves the user interface, handles incoming HTTP requests, runs the application logic, and talks to the database on the user's behalf. In this lab, the Nextcloud container fills this role.

## The Database Tier
This tier stores persistent data such as user accounts, settings, and file metadata, and answers queries from the application tier. In this lab, the MariaDB container fills this role.

## Why Separate Them?
Keeping the web server and database in separate containers lets each be scaled, updated, backed up, or restarted without affecting the other. It also improves security, since the database can be kept off the public network and reachable only by the app tier. If one container crashes, the failure is isolated and easier to troubleshoot than a single bundled system.
