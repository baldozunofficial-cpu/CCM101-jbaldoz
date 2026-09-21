# Mission Reflection

**1. Why is object storage better suited for storing millions of photos than a traditional block storage hard drive?**

Block storage works like a hard drive attached to one server, so its capacity is fixed and has to be planned and paid for in advance. Object storage keeps each photo as an independent object with its own metadata and unique ID in a flat structure, so it can grow to millions of files without limits. Photos can also be retrieved directly through an HTTP API, which fits web and mobile apps well.

**2. How did using Docker make it easier to deploy the MinIO storage server?**

Docker made deployment much easier because one command downloaded the MinIO image, started the server, mapped the ports, and set the login credentials. I did not have to install MinIO or its dependencies manually. When my first attempt failed, I could remove the container and run it again in seconds, which made troubleshooting simple.

**3. What is a "bucket" in the context of cloud storage?**

A bucket is a container in object storage that holds objects, similar to a top-level folder. Each bucket has a unique name, and access settings can be applied to it. In this lab, my client-photos bucket held the file I uploaded.

**4. How do you think large enterprise companies ensure their object storage data is not lost if the physical server crashes?**

Large companies protect object data through replication, keeping multiple copies across different drives, servers, and data centers. Many systems also use erasure coding, which splits data into pieces with extra parity so lost pieces can be rebuilt. Versioning and regular backups add further protection against accidental deletion.

**5. How is your confidence in navigating the Linux command line growing?**

My confidence in the Linux command line has grown. I can now run Docker commands, read error messages, check containers with docker ps, and use git and nano from the terminal. Fixing the image pull error and the name conflict taught me to read errors carefully instead of guessing. I still want more practice with longer commands and Git conflicts.
