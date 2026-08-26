
## Linux Server Investigation

Operating System: Ubuntu 24.04.4 LTS
Checked using lsb_release -a

CPU Information: Intel Xeon E312xx (Sandy Bridge, IBRS update), 1 CPU core
Checked using lscpu

Memory: 1.9 GiB total RAM
Checked using free -h

Disk Space: 19 GB total disk space on the main partition
Checked using df -h
##
If this Linux server were migrated to the cloud, which AWS, Azure, and GCP services could host it?
Since this server is small and general-purpose, with only 1 CPU core and under 2 GB of RAM, it would be a good fit for entry-level virtual machine services on any of the three major cloud platforms:

AWS: This server could be hosted on Amazon EC2, using a small instance type like t2.micro or t3.micro, which are designed for low-cost, general-purpose workloads.

Azure: This server could be hosted on Azure Virtual Machines, using a small size like B1s, which is suitable for low-traffic and lightweight applications.

Google Cloud Platform: This server could be hosted on Compute Engine, using a small machine type like e2-micro, which is designed for lightweight workloads.

## Terminal Output

**Operating System:**


<img width="699" height="236" alt="Screenshot 2026-08-26 11 48 02 AM" src="https://github.com/user-attachments/assets/b59eda25-e554-47c4-b124-c55c84b96138" />


**CPU Information:**


<img width="934" height="723" alt="Screenshot 2026-08-26 11 48 46 AM" src="https://github.com/user-attachments/assets/8f0d34b3-8d1e-4ec1-9aae-2f8c88b30106" />


**Memory:**


<img width="934" height="71" alt="Screenshot 2026-08-26 11 49 03 AM" src="https://github.com/user-attachments/assets/aa9d94dd-bb16-45bb-986e-c5a6f38a5ce2" />


**Disk Space:**


<img width="934" height="723" alt="Screenshot 2026-08-26 11 48 46 AM" src="https://github.com/user-attachments/assets/5ef9cacb-d525-4398-9ff7-0b7735c2895f" />


