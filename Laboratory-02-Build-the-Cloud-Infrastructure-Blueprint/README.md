# Laboratory 02 – Build the Cloud Infrastructure Blueprint

## Mission Overview

This laboratory activity focuses on understanding and planning a basic cloud infrastructure for the fictional company **CloudNova Technologies**. Using a Linux server provided through the KillerCoda Playground, I examined the available system resources, identified the main components of cloud infrastructure, compared equivalent services from AWS, Microsoft Azure, and Google Cloud Platform, and created a simple cloud architecture diagram. The results were organized into a Cloud Infrastructure Assessment Report.

## Objectives

* Identify and explain the main components of cloud infrastructure.
* Examine the hardware and software resources available in a Linux environment.
* Understand the differences between compute, storage, networking, and identity resources.
* Explain how different cloud infrastructure components work together.
* Create clear and organized technical documentation using Markdown.
* Add the completed laboratory outputs to a structured GitHub Cloud Computing Portfolio.

## Cloud Infrastructure Components

* **Compute** – Provides the processing resources needed to run applications and services, including CPU and RAM. These resources were examined using `lscpu` and `free -h` on the KillerCoda server.
* **Storage** – Provides space for storing operating system files, applications, and data. The `df -h` command was used to examine disk space and partitions, including `/dev/vda1` mounted at `/`.
* **Networking** – Allows the server to communicate with other systems and access network resources. The `ip a` command was used to identify network interfaces and the server's assigned IP address.
* **Identity and Access Management (IAM)** – Controls who can access systems and resources and determines what actions users are allowed to perform through accounts, groups, and permissions.
* **Operating System** – Acts as the main software layer that manages hardware resources and provides an environment for applications. The server was running **Ubuntu 24.04.4 LTS**, verified using `cat /etc/os-release`.

Additional information and findings are available in `cloud-components.md` and `infrastructure-report.md`.

## Tools Used

* **KillerCoda Playground** – Used as the Linux server environment for system investigation.
* **Git and GitHub** – Used for version control and maintaining the cloud computing portfolio.
* **Markdown** – Used to create and organize technical documentation.
* **Draw.io** – Used to design the cloud infrastructure architecture diagram.

## Linux Commands Executed

| Command               | Purpose                                     |
| --------------------- | ------------------------------------------- |
| `cat /etc/os-release` | Identify the installed operating system     |
| `uname -r`            | Determine the Linux kernel version          |
| `lscpu`               | View CPU information and processor details  |
| `free -h`             | Check available and used memory             |
| `df -h`               | View disk partitions and storage capacity   |
| `ip a`                | Display network interfaces and IP addresses |

## Repository Structure

* `README.md` – Provides an overview of Laboratory 02 and its objectives
* `cloud-components.md` – Contains explanations of the major cloud infrastructure components
* `cloud-provider-comparison.md` – Compares equivalent services from AWS, Microsoft Azure, and Google Cloud Platform
* `infrastructure-report.md` – Presents the results of the Linux server investigation
* `reflection.md` – Contains the laboratory reflection and key lessons learned
* `screenshots/` – Stores screenshots and other supporting evidence from the laboratory activity

## Summary

This laboratory provided practical experience in examining a Linux environment and relating its resources to common cloud infrastructure components. It also demonstrated how compute, storage, networking, operating systems, and access management work together to support cloud-based applications and services. The completed files and diagrams form part of the **Cloud Computing Portfolio** for CloudNova Technologies.
