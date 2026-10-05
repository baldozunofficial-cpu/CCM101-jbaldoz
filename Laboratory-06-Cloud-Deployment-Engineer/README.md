# Laboratory 06 – The Cloud Deployment Engineer

## Mission Overview

In this laboratory, I took on the role of a **Cloud Deployment Engineer**. My task was to deploy a two-tier application using **Docker Compose**. The application consisted of two containers: one for the web application and another for the MySQL database. Instead of creating and starting each container separately, I used a single `docker-compose.yml` file to define and manage both services.

After successfully deploying and testing the application, I stopped and removed the containers. Finally, I used Git to save and manage my project files.

## Objectives

* Create a project folder and write a `docker-compose.yml` file.
* Configure the application and database services with their ports, environment variables, and volumes.
* Start the entire application in the background using a single command.
* Check if the containers were running properly and verify that the application could connect to the database.
* Stop and remove the containers after completing the test.
* Use Git to save and manage the project files.

## Commands Executed

| Command                                    | Description                                                                       |
| ------------------------------------------ | --------------------------------------------------------------------------------- |
| `mkdir docker-lab06`                       | Creates a new folder for the project.                                             |
| `cd docker-lab06`                          | Moves into the project folder.                                                    |
| `nano docker-compose.yml`                  | Opens the Compose file in the Nano text editor so the services can be configured. |
| `docker-compose up -d`                     | Builds and starts all the services in detached mode.                              |
| `docker-compose ps`                        | Displays the status of the running containers.                                    |
| `docker-compose down`                      | Stops and removes the containers and the network created by Compose.              |
| `git init`                                 | Initializes a Git repository in the project folder.                               |
| `git add .`                                | Adds the project files to the Git staging area.                                   |
| `git commit -m "Add docker-compose setup"` | Saves the staged changes with a descriptive commit message.                       |
| `git push origin main`                     | Uploads the committed changes to the remote repository.                           |

## Skills Learned

Through this laboratory, I learned how to:

* Create and configure a `docker-compose.yml` file.
* Understand how the `services:` section defines the containers used by an application.
* Connect containers using service names, such as `MYSQL_HOST: db`.
* Deploy multiple containers together using a single Docker Compose command.
* Monitor running containers using `docker-compose ps`.
* Stop and clean up containers and networks using `docker-compose down`.
* Use environment variables to configure application and database settings.
* Use volumes to preserve database data.
* Apply basic Git commands to save, track, and share project files.

