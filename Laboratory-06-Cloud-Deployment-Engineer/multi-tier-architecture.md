# Multi-Tier Architecture

A **Two-Tier Architecture** divides an application into two main layers: the **application/presentation tier** and the **database tier**. Each tier has a specific role and runs independently, allowing the system to be easier to manage, maintain, and troubleshoot.

## The Web/Application Tier

The **Web/Application Tier** is the part of the system that users interact with. It handles incoming HTTP requests, displays the user interface, processes application logic, and communicates with the database when information is needed.

In this laboratory, the **Nextcloud container** serves as the Web/Application Tier. It provides the web interface and handles user requests, while also connecting to the MariaDB database to store and retrieve necessary information.

## The Database Tier

The **Database Tier** is responsible for storing and managing the application's persistent data. This may include user accounts, passwords, system settings, file information, and other metadata.

In this laboratory, the **MariaDB container** serves as the Database Tier. It receives database requests from the Nextcloud application and stores the information so it can be retrieved when needed.

## Why Separate Them?

Separating the web/application server and database into different containers provides several advantages. Each container can be **updated, restarted, backed up, or scaled independently** without directly affecting the other service.

This separation also improves **security** because the database does not need to be exposed directly to users on the public network. Instead, it can communicate only with the application container through the Docker network.

Another benefit is **fault isolation**. If the application container crashes, the database can continue running, and vice versa. This makes problems easier to identify and troubleshoot.
