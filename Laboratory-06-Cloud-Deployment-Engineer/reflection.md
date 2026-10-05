# Mission Reflection

**1. Compose vs. manual commands.** Writing a docker-compose.yml made my job easier because I defined the whole setup once and started it with a single command. Instead of typing a long docker run command for each container and repeating every port, password, and image option, Compose read one file and created both containers with the right settings and networking. The file is also repeatable, easy to share, and can be saved in Git.

**2. Tab vs. spaces.** YAML only accepts spaces for indentation. If I use a Tab, Compose throws a parsing error and nothing is deployed until I fix it. Even the wrong number of spaces can quietly change the structure, such as placing a setting under the wrong service.

**3. Environment variables.** Variables like MYSQL_PASSWORD let me configure a container at startup without changing its image. The same mariadb and nextcloud images work for anyone, and matching credentials let the app connect to the database. This is fine for a lab, but real deployments should use secrets or .env files so passwords stay out of version control.

**4. Deploying in minutes.** It felt surprisingly fast and powerful. After the images were pulled, both containers were running within minutes, and seeing the Nextcloud setup page with the "Autoconfig file detected" banner showed that the app had found the database on its own. Something that once took hours of server setup took one YAML file and one command.

**5. Evolution since Mission 1.** In Mission 1, I mostly saw cloud computing as services that someone else runs, like online storage and apps. Now I understand the infrastructure behind them: containers, networking, separate tiers, and infrastructure as code. I see that cloud engineers build repeatable systems from files rather than setting things up by hand.
