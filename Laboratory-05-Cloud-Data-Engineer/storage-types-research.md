# Types of Cloud Storage

## Comparison Table

| Storage Type | Description | Primary Use Case | Cloud Provider Example |
|--------------|-------------|------------------|------------------------|
| **Block Storage** | Splits data into fixed-size blocks, each with its own address. The blocks are attached to a server like a physical hard drive, and the operating system manages them through a file system. | Best for workloads needing fast, low-latency reads and writes, such as databases, virtual machine disks, and operating system volumes. | AWS EBS (Elastic Block Store) |
| **File Storage** | Stores data as files in a hierarchy of folders and directories. Multiple servers can access it at once over a network protocol such as NFS or SMB. | Best for shared access to files across many users or servers, such as shared drives, content management, and home directories. | AWS EFS (Elastic File System) |
| **Object Storage** | Stores data as objects in a flat structure. Each object holds the data itself, its metadata, and a unique ID, and is accessed through an HTTP API rather than mounted as a drive. | Best for large amounts of unstructured data, such as images, videos, backups, and logs, that need to scale without limit. | AWS S3 (Simple Storage Service) |

## Why Object Storage for User-Uploaded Images
Object Storage is the best choice for storing your users' uploaded images because it scales to millions of files without any capacity planning, and you only pay for what you store. Each image is stored with its own metadata and a unique URL, so it can be served directly to web and mobile apps through a simple API. It also replicates data across multiple locations by default, which keeps your users' photos safe and available even if hardware fails.
