# Infrastructure Report

## Checkpoint 2 – Investigate the Cloud Server

### Operating System
- *Command used:* cat /etc/os-release
- *Result:* Ubuntu 24.04.4 LTS (Noble Numbat)

### Kernel Version
- *Command used:* uname -r
- *Result:* 6.8.0-136-generic

### CPU Model
- *Command used:* lscpu
- *Result:* Intel Xeon E312xx (Sandy Bridge, IBRS update)

### Number of CPU Cores
- *Command used:* lscpu
- *Result:* 1 CPU, 1 core per socket, 1 thread per core (total: 1 logical CPU)

### Total RAM
- *Command used:* free -h
- *Result:* 1.9 GiB total (413Mi used, 831Mi free, 1.5Gi available)

### Disk Capacity
- *Command used:* df -h
- *Result:*

| Filesystem | Size | Used | Avail | Use% | Mounted on |
|---|---|---|---|---|---|
| /dev/vda1 | 19G | 5.4G | 13G | 30% | / |
| /dev/vda16 | 881M | 117M | 703M | 15% | /boot |
| /dev/vda15 | 105M | 6.2M | 99M | 6% | /boot/efi |
| tmpfs | 191M | 996K | 190M | 1% | /run |
| tmpfs | 952M | 84K | 952M | 1% | /dev/shm |
| tmpfs | 5.0M | 0 | 5.0M | 0% | /run/lock |

### Mounted File Systems
- / — root filesystem (main OS partition, 19G)
- /boot — boot partition (881M)
- /boot/efi — EFI system partition (105M)
- /run, /dev/shm, /run/lock — temporary in-memory filesystems (tmpfs)

### Hostname
- *Command used:* hostname
- *Result:* ubuntu

### IP Address
- *Command used:* ip a
- *Result:*
  - enp1s0 (main network interface): 172.30.1.2/24
  - lo (loopback): 127.0.0.1
  - docker0 (Docker bridge): 172.17.0.1
