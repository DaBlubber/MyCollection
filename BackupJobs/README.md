# Backup Tasks for varius Systems

Here is a Collection of my internal Backup process.

## What is the problem?

The problem is that I have many different systems. For example, various database systems like MariaDB, Postgres, and MSSQL for Linux. Also, Docker containers, Compose files, configs, etc.

Here is a collection of Ansible Playbooks and Bash scripts for them.

## Infrastructure

TBD

## What's Inside

* **Ansible Playbooks:**
    * Run Sub Jobs that mostly running bash scripts on dedicted systems
* **Jenkins Pipelines:**
    * Run Ansible Playbooks as Job Collection
* **Bash Scripts:**
    * Run the most executions because they were more fail safe then my playbooks
* **Docker Compose Files for Portainer:**
    * Run different Container with e.g. Databases, Webserver and Services that i want to backup systems
* **Git:**
    * Where all Playbooks, Pipelines, Bash Scripts and Compose Files are saved and updated.

## Process

* 1. Check the certificate files to see if the certificate is about to expire.
* 2. If the certificate is nearing expiration, trigger the Jenkins job.
* 3. Remove all old sync files.
* 4. Copy the new Let's Encrypt files for preparation.
* 5. Rename them for the respective use cases.
* 6. Remove all old certificate files from the target systems.
* 7. Synchronize the new Let's Encrypt files to the target systems.
* 8. Restart the necessary containers or services.
* 9. Prepare the certificate files on my personal storage.
* 10. Check if everthings works.

## Technology Stack

My Technology Readme is currently in construction


## Usage

* These configurations are tailored to my specific homelab environment.
* Feel free to browse and adapt them to your needs.
* Please exercise caution when running automation scripts on your own systems. It is recommended to understand what each task does before execution.

## Contributing

* If you have suggestions for improvements or find any issues, please feel free to open a pull request or issue.
* I am always welcoming constructive feedback.

## Disclaimer

* This repository is provided as-is, without any warranties.
* Use these configurations at your own risk.

## Contact

* If you have any questions feel free to create an issue.

Enjoy exploring my homelab automation!