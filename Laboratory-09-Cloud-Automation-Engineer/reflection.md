# Mission Reflection

1. Automation is critical because managing hundreds of cloud servers by hand is slow, repetitive, and easy to get wrong. A script or scheduled job does the same task the same way every time, without someone having to remember it. It lets a small team handle a huge number of servers consistently.

2. The danger is that automation multiplies mistakes just as efficiently as it multiplies good work. If a script scheduled to run on 1,000 servers has a destructive typo, such as a wrong path in a delete command, it could erase data on every server at once, possibly before anyone notices. That is why scripts should be tested on a small group first and backed up.

3. Writing a Bash script is imperative: I list the exact commands to run, in order, like creating a folder and then compressing it. A Docker Compose YAML file is declarative: I describe the end result I want, such as which containers and ports should exist, and Docker figures out how to get there. The script is a recipe of steps, while the YAML file is a description of the finished meal.

4. Looking back at Laboratory 1 to 9, I started the semester thinking cloud computing was just someone else's computer. Now I see it as a set of connected skills: Linux basics, Git and GitHub, containers, and automation. Each lab built on the last, and I learned that the cloud is really about managing resources reliably and at scale.

5. I enjoyed the Cloud Automation Engineer role the most. Writing the backup script and watching it run felt rewarding, and scheduling it with cron showed me how work can happen without me being there. It felt like the role that ties everything together.
