# Mission Reflection

Block storage works like a hard drive attached to one server, so its capacity is fixed and has to be planned and paid for in advance. Object storage keeps each photo as an independent object with its own metadata and unique ID in a flat structure, so it can grow to millions of files without limits. Photos can also be retrieved directly through an HTTP API, which fits web and mobile apps well. For a client whose users keep uploading images, this flexibility matters more than the raw speed of one drive.

Docker made deployment much easier because one command downloaded the MinIO image, started the server, mapped the ports, and set the login credentials. I did not have to install MinIO or its dependencies manually. It also kept the setup consistent, so the server behaved the same way each time. When my first attempt failed, I could remove the container and run it again in seconds, which made troubleshooting simple.

A bucket is a container in object storage that holds objects, similar to a top-level folder. Each bucket has a unique name, and access settings can be applied to it. Buckets make it easy to organize files by project or client and to control who can see them. In this lab, my client-photos bucket held the file I uploaded.

Large companies protect object data through replication, keeping multiple copies across different drives, servers, and data centers. Many systems also use erasure coding, which splits data into pieces with extra parity so lost pieces can be rebuilt. Versioning and regular backups add further protection against accidental deletion.

My confidence in the Linux command line has grown. I can now run Docker commands, read error messages, check containers with docker ps, and use git and nano from the terminal. Fixing the image pull error and the name conflict taught me to read errors carefully instead of guessing. I still want more practice with longer commands and Git conflicts.
