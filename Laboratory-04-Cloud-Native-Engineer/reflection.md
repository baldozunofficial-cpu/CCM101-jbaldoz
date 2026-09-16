# Mission Reflection

Working through this lab gave me a much clearer picture of how containers
compare to traditional virtual machines, both in theory and in practice.

The difference in boot time was the most striking part of this mission. Setting
up a Virtual Machine usually means installing a full guest operating system,
waiting through a lengthy boot process, and configuring drivers and services
before anything is usable — this can take anywhere from several minutes to
over an hour. A Docker container, by contrast, shares the host machine's
kernel and only packages the application and its dependencies. This meant I
had Nginx running in seconds rather than minutes, since there was no OS to
boot at all — just a lightweight process starting up.

Port mapping (`-p 8080:80`) was necessary because a container's internal
network is isolated from the host by default. Nginx inside the container was
listening on port 80, but without explicitly mapping that to port 8080 on my
host machine, there would be no way for me to reach the web server from
outside the container. The mapping essentially opens a communication channel
between my machine and the isolated container environment.

Running `docker rm` taught me an important lesson about how containers handle
data. Because containers are meant to be temporary and disposable, any data
written inside the container's writable layer is deleted permanently once the
container is removed, unless that data was explicitly stored in a persistent
volume outside the container.

I think containerization has a huge impact on how developers and IT
operations teams collaborate. Since a container packages the application code
together with its exact runtime environment, it eliminates the classic "it
works on my machine" problem. Developers can hand operations teams a
container image that behaves identically in development, testing, and
production, which naturally supports the DevOps philosophy of shared
responsibility and continuous, reliable deployment.

My GitHub portfolio is steadily evolving into a stronger showcase of
practical, cloud-native skills — one lab and one checkpoint at a time.
