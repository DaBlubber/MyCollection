# Letsencrypt Rollout Task
Here is a Collection of my internal Rollout of Letsencrypt Certificates which i use for my Reverse Proxy and other Servers.

## What is the problem?

The problem I wanted to solve was that I wanted to access everything internally and externally via DNS and HTTPS instead of just using IP addresses. Since I was and still am well-versed in HAProxy, I chose this software to manage my entire internal and external infrastructure. To use cost-effective, valid DNS connections over HTTPS, I opted for Let's Encrypt as my system. The downside is that the certificate needs to be renewed every 90 days. Since I'm quite lazy when it comes to doing this manually each time, I fully automated the process using Jenkins, Ansible, and Bash.

## Infrastructure

Cloudflare DNS Administration with my own Domains
External Docker Server with an NGINX Proxy Manager (Its easy to handle Letencrypt with Cloudflare API)
Internal and External HAProxy as my Reverse Proxy
Some other Services that need updated Certificates

## What's Inside

* **Ansible Playbooks:**
    * Run Sub Jobs that mostly running bash scripts on dedicted systems
* **Jenkins Pipelines:**
    * Run Ansible Playbooks as Job Collection
* **Bash Scripts:**
    * Run the most executions because they were more fail safe then my playbooks
* **Docker Compose Files for Portainer:**
    * Run e.g. NGINX Proxy Manager and HAProxy structure
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