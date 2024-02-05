---
all:
  vars:
    db_ip: ${db}

  hosts:
    app:
      ansible_host: ${app}

    db:
      ansible_host: ${db}

app:
  hosts:
    app:

db:
  hosts:
    db:
