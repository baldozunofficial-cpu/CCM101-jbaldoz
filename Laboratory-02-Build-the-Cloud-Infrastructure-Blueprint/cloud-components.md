# Cloud Infrastructure Components

## Compute Resources
**Purpose:** Compute resources refer to the processing power (CPU) and memory (RAM) that execute tasks, run applications, and process data.

**Importance in Cloud Computing:** Compute is the core resource cloud providers let users scale up or down based on demand, which is far more flexible than fixed physical hardware.

**Relation to KillerCoda Linux Environment:** The server has an Intel Xeon E312xx CPU and 1.9 GiB of RAM, as shown by the `lscpu` and `free -h` commands. This mirrors how a cloud provider like AWS provisions a virtual instance for a user.

## Storage Resources
**Purpose:** Storage resources are where data, files, and system information are kept, whether temporarily (RAM-based) or persistently (disk-based).

**Importance in Cloud Computing:** Reliable, scalable storage lets cloud applications save and retrieve data on demand and ensures data persists even when compute instances are stopped or restarted.

**Relation to KillerCoda Linux Environment:** The `df -h` command showed the server's disk partitions, such as `/dev/vda1` (19G, mounted at `/`) for the root filesystem, and `/boot`, `/boot/efi` for system boot files. These act as the persistent storage layer of this virtual server, similar to how cloud providers offer block storage (e.g., AWS EBS) attached to virtual machines.

## Networking Resources
**Purpose:** Networking resources allow servers to communicate with each other, with users, and with the internet through IP addressing, interfaces, and routing.

**Importance in Cloud Computing:** Networking connects compute and storage resources together and exposes services to the outside world. Without it, cloud resources would be isolated and inaccessible.

**Relation to KillerCoda Linux Environment:** The `ip a` command revealed the server's network interfaces: `enp1s0` with a private IP (172.30.1.2/24) for external communication, `lo` (loopback, 127.0.0.1) for internal communication, and `docker0` (172.17.0.1) for container networking. This setup resembles how cloud VMs are assigned private/public IPs and virtual network interfaces.

## Operating System
**Purpose:** The operating system manages hardware resources, runs processes, and provides the environment in which applications and services operate.

**Importance in Cloud Computing:** The OS is the foundation that allows compute, storage, and networking resources to be accessed and managed consistently across virtual machines and cloud instances.

**Relation to KillerCoda Linux Environment:** The `cat /etc/os-release` command confirmed the server runs Ubuntu 24.04.4 LTS, a lightweight, stable, and well-supported distribution by all major cloud providers.
