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
* **Bash Scripts:**
    * Run the most executions because they were more fail safe then my playbooks
* **Docker Compose Files for Portainer:**
    * Run different Container with e.g. Databases, Webserver and Services that i want to backup systems
* **Git:**
    * Where all Playbooks, Pipelines, Bash Scripts and Compose Files are saved and updated.

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