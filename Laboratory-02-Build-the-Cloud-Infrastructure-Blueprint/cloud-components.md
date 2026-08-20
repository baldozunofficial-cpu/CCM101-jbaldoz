# Cloud Infrastructure Components

## Compute Resources

**Purpose:** Compute resources provide the processing power needed to run applications, execute commands, and handle workloads. They mainly include the CPU and memory (RAM) of a system.

**Importance in Cloud Computing:** Compute resources allow organizations to run applications without purchasing and maintaining physical servers. Cloud platforms also make it possible to increase or decrease computing resources based on workload requirements.

**Relation to KillerCoda Linux Environment:** The KillerCoda server uses an Intel Xeon E312xx processor and has approximately 1.9 GiB of RAM. These resources were identified using the `lscpu` and `free -h` commands. This is similar to a cloud virtual machine, where users are provided with a specific amount of CPU and memory for running their applications.

## Storage Resources

**Purpose:** Storage resources provide space for operating system files, applications, and user data. Storage can be temporary, such as RAM, or persistent, such as disk storage.

**Importance in Cloud Computing:** Cloud storage allows data to be stored, accessed, and managed without relying on a physical storage device owned by the user. It can also be expanded when additional capacity is needed.

**Relation to KillerCoda Linux Environment:** The `df -h` command was used to examine the available disk space and partitions. The server includes `/dev/vda1`, with approximately 19G of storage mounted at `/`, along with `/boot` and `/boot/efi` partitions used for system files. These storage resources are similar to the virtual disks or block storage attached to cloud-based virtual machines.

## Networking Resources

**Purpose:** Networking resources allow computers, servers, applications, and users to communicate with one another. They include network interfaces, IP addresses, and other networking configurations.

**Importance in Cloud Computing:** Networking is essential because it connects cloud resources and allows applications to communicate with users and other services. Proper network configuration also helps control access and improve the security of cloud environments.

**Relation to KillerCoda Linux Environment:** The `ip a` command was used to examine the server's network interfaces. The system included `enp1s0` with the private IP address `172.30.1.2/24`, the `lo` loopback interface with `127.0.0.1`, and `docker0` with `172.17.0.1` for container networking. This demonstrates how a Linux server can use multiple virtual network interfaces for different types of communication, similar to networking configurations used in cloud environments.

## Operating System

**Purpose:** The operating system manages the computer's hardware and software resources. It provides the environment needed to run applications, manage files, control processes, and interact with system hardware.

**Importance in Cloud Computing:** An operating system provides the foundation for applications and services running on cloud-based virtual machines. It also allows administrators to configure, monitor, and manage the resources provided by the cloud platform.

**Relation to KillerCoda Linux Environment:** The `cat /etc/os-release` command confirmed that the server is running **Ubuntu 24.04.4 LTS**. Ubuntu is commonly used in cloud environments because it is stable, flexible, and supported by major cloud providers. The Linux environment also provides useful command-line tools for monitoring and managing cloud-based systems.

cat Laboratory-02-Build-the-Cloud-Infrastructure-Blueprint/cloud-components.md
