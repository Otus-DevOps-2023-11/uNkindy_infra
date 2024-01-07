### Homework №3 Otus DevOps (Bastion Hosts)

IPs:

bastion_IP = 178.154.206.227
someinternalhost_IP = 10.128.0.34

### Homework №4 Otus DevOps (Yandex Cloud)

Stand credentials:

testapp_IP = 84.201.129.110
testapp_port = 9292

Bash scripts for direct deploy. All scripts are executables:
- install_ruby.sh
- install_mongodb.sh
- deploy.sh

For init deploy in this stand uses cloud-init config file __init.yml__

CLI command for deploy instance with cloud-init:
```console
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata-from-file user-data=./init.yml \
  --metadata serial-port-enable=1
```

### Homework №5 Otus DevOps (Packer)

Deploy monolith app in Yandex Cloud with packer image.

[For checkout: http://158.160.58.72:9292/](http://158.160.58.72:9292/)

### Homework №6 Otus DevOps (Terraform-1)

Deploy monolith app in Yandex Cloud with Terraform infrastructure code.

[balancer](http://158.160.131.102:9292/)
[first app](http://158.160.111.172:9292/)
[second app](http://158.160.114.41:9292/)
