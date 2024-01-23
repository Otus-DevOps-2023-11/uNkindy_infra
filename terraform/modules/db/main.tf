# terraform {
#   required_providers {
#     yandex = {
#       source = "yandex-cloud/yandex"
#     }
#   }
#   required_version = ">= 0.13"
# }

resource "yandex_compute_instance" "db" {
  name = "reddit-db"
  labels = {
    tags = "reddit-db"
  }

  resources {
    cores  = 2
    memory = 2
  }

  connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    private_key = file(var.private_key_path)
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }

  metadata = {
  ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
  provisioner "file" {
    source      = "/home/kita/Documents/Otus_DevOps/Otus_DevOps_Unit_2/uNkindy_infra/terraform/modules/db/files/mongodb.conf"
    destination = "/tmp/mongodb.conf"
  }
  provisioner "remote-exec" {
    script = "/home/kita/Documents/Otus_DevOps/Otus_DevOps_Unit_2/uNkindy_infra/terraform/modules/db/files/db_bind.sh"
  }

}
