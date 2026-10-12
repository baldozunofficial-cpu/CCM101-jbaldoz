# Security Audit Report

## Chapter 8 Security Concepts

### The Principle of Least Privilege (PoLP)
The Principle of Least Privilege means giving a user, application, or service only the minimum permissions needed to do its job, and nothing more. It is important for cloud user accounts because if an account is stolen or misused, the damage is limited to what that account was allowed to do. For example, a developer who only needs to read logs should not have permission to delete servers.

### Attack Surface
An attack surface is the total number of points where an unauthorized person could try to enter or extract data from a system. For a virtual machine, this includes open network ports, running services, installed software, and user accounts. The more things that are exposed or running, the more opportunities an attacker has, so reducing the attack surface makes the VM harder to compromise.

### Default Deny Policy
A Default Deny Policy blocks all traffic by default and only allows connections that are explicitly permitted. It is safer than trying to block hackers one at a time because you can never predict every threat or attacker address, and one missed rule leaves a gap. With default deny, anything you forgot or don't know about is blocked automatically, so you only have to manage a short list of trusted exceptions.
