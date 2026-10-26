# Final Reflection: Missions 1 to 10

## Introduction

Before this course, I thought cloud computing was just "computers on the
internet" that companies rent. I did not know how they were built, how they
were protected, or what happens when something breaks. After ten missions, I
understand that the cloud is made of many small parts that work together:
virtual machines, networks, containers, firewalls, and scripts.

In Mission 10, I built a small private cloud for a pretend client, CloudNova
Technologies. This was the first time I had to use everything I learned in one
project. It was hard, and I made mistakes, but it showed me how much I had
grown since Mission 1.

## The Journey

### Missions 1 to 3: Learning the basics

In the first missions, I learned what cloud computing is and why companies use
it instead of buying and running their own big machines. I learned about
virtualization, which means running many "virtual" computers on one real
computer. This idea is the base of almost everything else in the course. I
also learned basic Linux commands, like moving between folders, making files,
checking permissions, and editing text.

At first, the black terminal screen was scary because there was no mouse to
click and no menu to guide me. [Add one thing that was hard or new for you.]
Over time, typing commands became faster than clicking through menus, and I
started to feel more confident.

### Missions 4 to 9: Learning the tools

In the middle missions, I moved from ideas to real practice. I learned about
networking, such as IP addresses, ports, and how one computer talks to
another. I learned about containers and Docker, which let me run an app in a
small, separate box that is easy to start, stop, and remove. I also learned
about storage and why data can disappear when a container is deleted unless I
use a volume.

[Write which mission was the hardest for you and why. Example: what you
tried, what error you saw, and how you got past it.] Each mission gave me a
new tool. I did not know it yet, but I would need all of them in Mission 10.
When I looked back, I could see that every mission was a small piece of the
final project.

### Mission 10: The Enterprise Cloud Architect

For the final mission, I put everything together. I made a plan first, then
built the project step by step:

1. **The foundation.** I drew an architecture diagram to show how all the parts
   connect: my laptop, the hypervisor, the virtual machine, the firewall, and
   the containers. Then I set up an Ubuntu Server virtual machine and
   set the network so I could open the website from my laptop's browser and
   connect with SSH.
2. **The application.** I installed Docker and Docker Compose. I wrote one
   `docker-compose.yml` file that starts two containers: WordPress for the
   website and MariaDB for the database. I used volumes so the data stays
   safe even if the containers are removed or the server restarts. To prove
   it, I made a test post, rebooted the server, and checked that the post was
   still there.
3. **The security.** I turned on the UFW firewall. I set the default rule to
   deny all incoming traffic, then allowed only SSH and the website port. This
   way, anything I did not need was closed.
4. **The automation.** I wrote a Bash script that backs up the database and
   deletes old backups so the disk does not fill up. I made it executable and
   used cron to run it every day at 2:00 AM. I checked the backup folder to
   confirm that new files were really being created.
5. **The documentation.** I wrote an operational manual so the client's IT
   team can deploy, secure, and maintain the system without my help. I also
   put all my raw code in the GitHub repository.

## Challenges and How I Solved Them

[Keep only the problems that really happened to you. Add what you saw on your
screen and what you did to fix it.]

**1. The firewall could lock me out.**
When I set up UFW, I learned that turning it on without allowing SSH first
would cut off my own connection to the server, and I would not be able to fix
it from outside. So I allowed SSH before enabling the firewall. This taught me
to think about the order of my steps before I press Enter.

**2. Docker can go around the firewall.**
I found out that Docker opens ports by changing the system's network rules
directly, so it can ignore UFW. This was surprising, because I thought the
firewall protected everything. To stay safe, I opened only the one port the
website needs. I did not publish the database port at all. The database can
only be reached by WordPress through the private Docker network.

**3. The script worked by hand but not in cron.**
When I ran my backup script myself, it worked. But cron runs with fewer
settings than my normal terminal, so it can fail if the paths are not
complete or the script is not executable. I fixed this by using full file
paths and running `chmod +x` on the script. To test it, I set cron to run
every minute for a short time, watched a new file appear, and then changed it
back to 2:00 AM.

**4. Passwords in the code.**
At first, I wrote my passwords right inside the compose file. Then I realized
that anyone who sees my GitHub repository could read them. I moved the
passwords into a `.env` file, added `.env` to `.gitignore`, and uploaded a
`.env.example` file with fake values instead.

## Key Lessons

- **Infrastructure as Code is powerful.** One file can rebuild the whole
  system in a few minutes. It is also a kind of documentation, because anyone
  can read it and see how the system is built.
- **Security means giving the least access needed.** Block everything first,
  then open only what is really needed. Never put passwords in a public
  repository.
- **Backups must be tested.** A backup that was never restored is just a hope.
  I learned to test the restore, not only the backup.
- **Automation saves time and prevents mistakes.** People forget things, but
  cron does not.
- **Documentation is part of the work.** If another person cannot follow my
  steps, the project is not finished.
- **Small steps and testing help.** Checking each part before moving on made
  problems easier to find.
- **Mistakes are part of learning.** Most of what I remember came from
  something that broke first.

## What I Would Do Differently

If I had more time, I would make the project stronger in these ways:

- Add **HTTPS** so the website traffic is encrypted.
- Copy the backups to **another place**, such as another server or cloud
  storage, so one failure does not destroy everything.
- Add **monitoring** so I get a warning when something stops working.
- Use stronger **secret management** instead of plain `.env` files.
- Start the documentation **earlier** and write it while I build, not after.

## Conclusion

This course changed how I see technology. Before, I only used websites and
apps. Now I understand the servers, networks, and security behind them. I can
build a small cloud system, protect it, back it up, and explain it to others.

Mission 10 was the hardest mission, but it was also the most useful. It proved
that I can take many small skills and join them into one working system. I
want to keep learning and use these skills in my future IT career.
