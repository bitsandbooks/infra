Role Name
=========

The **ns-docker** role sets up Docker.

Requirements
------------

No known requirements.

Role Variables
--------------

The role has a variable called *hostname* (default value: *myhost*) and a variable called **docker**, which contains keys/values for *ubuntu_apt_package*, *ubuntu_apt_repo* and *ubuntu_apt_repo_key*.

Dependencies
------------

No known dependencies

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: ns-docker, hostname: myhostname }

License
-------

BSD

Author Information
------------------

By [Rob Dumas](https://github.com/bitsandbooks)
