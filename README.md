### Homework №3 Otus DevOps

IPs:

bastion_IP = 178.154.206.227
someinternalhost_IP = 10.128.0.34

### Homework №4 Otus DevOps

Stand credentials:

testapp_IP = 84.201.129.110
testapp_port = 9292

CLI command for deploy instance:
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
