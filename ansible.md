## Ansible
- [Ansible](https://docs.ansible.com/ansible/latest/index.html), Ansible is an IT automation tool. It can configure systems, deploy software, and orchestrate more advanced IT tasks such as continuous deployments or zero downtime rolling updates.
    - [Installation](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
    - Concepts
        - [Inventory](https://docs.ansible.com/ansible/latest/inventory_guide/index.html), An inventory is a list of managed nodes, or hosts, that Ansible deploys and configures
        - [Vault](https://docs.ansible.com/ansible/latest/vault_guide/index.html#ansible-vault), Ansible Vault encrypts variables and files so you can protect sensitive content such as passwords or keys rather than leaving it visible as plaintext in playbooks or roles. 
        - [Ansible Playbook](https://docs.ansible.com/ansible/latest/playbook_guide/index.html), Playbooks are automation blueprints, in YAML format, that Ansible uses to deploy and configure nodes in an inventory. 
            - [Keywords](https://docs.ansible.com/ansible/latest/reference_appendices/playbooks_keywords.html), These are the keywords available on common playbook objects. Keywords are one of several sources for configuring Ansible behavior. 
                - Play
                - Role
                - Block
                - Task

            - [Ansible Galaxy](https://docs.ansible.com/ansible/latest/galaxy/user_guide.html), Ansible Galaxy refers to the Galaxy website, a free site for finding, downloading, and sharing community developed roles.
            - Sample Playbook

                `playbook.yml`
                ```yml
                ---

                - name: playbook # Playbook Name
                  hosts: lab #Labels from inventory
                  tasks:
                    - name: connection_check # Name of the task
                    ping: # Module to call
                ```

                `output`
                ```bash
                root@ubuntu-xenial:/opt/infra/ ansible-playbook playbook/playbook.yml -v
                Using /opt/infra/ansible.cfg as config file

                PLAY [playbook] *************************************************************

                TASK [setup] *******************************************************************
                ok: [lab01]
                ok: [lab02]

                TASK [connection_check] ********************************************************
                ok: [lab01] => {"changed": false, "ping": "pong"}
                ok: [lab02] => {"changed": false, "ping": "pong"}

                PLAY RECAP *********************************************************************
                lab01                      : ok=2    changed=0    unreachable=0    failed=0   
                lab02                      : ok=2    changed=0    unreachable=0    failed=0   

                root@ubuntu-xenial:/opt/infra/
                ```

<br/>

## Standard Ops Procedures
- To support Password Authentication
    - Install ansible and sshpass
        ```bash
        apt update
        apt install software-properties-common
        add-apt-repository --yes --update ppa:ansible/ansible
        apt install ansible
        apt install sshpass
        ```

    - Enable Password Authentication in sshd (in each node)
        ```bash
        vi /etc/ssh/sshd_config 
        # Change to no to disable tunnelled clear text passwords
        PasswordAuthentication yes
        ```

<br/>

## Troubleshooting
- Private Key permission is too open, and caused git clone failure
  ```bash
    "stderr": "Cloning into '/root/kiss'...\nWarning: Permanently added
    'gitlab.com,172.65.251.78' (ECDSA) to the list of known
    hosts.\r\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\r\n@
    WARNING: UNPROTECTED PRIVATE KEY FILE!
    @\r\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\r\nPermissions
    0644 for '/root/gitlab.key' are too open.\r\nIt is required that your private
    key files are NOT accessible by others.\r\nThis private key will be
    ignored.\r\nLoad key \"/root/gitlab.key\": bad permissions\r\nPermission denied
    (publickey,keyboard-interactive).\r\nfatal: Could not read from remote
    repository.\n\nPlease make sure you have the correct access rights\nand the
    repository exists.\n"
    ```
	
    `Solution`  Change Permission to "0400" to set RO to owner only
    ```yml
    - name: Copy Private key to host
        copy:
        src: ../keys/id_rsa
        dest: /root/gitlab.key
        mode: "0400"
    ```
