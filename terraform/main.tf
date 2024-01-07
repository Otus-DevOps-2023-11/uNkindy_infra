terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone                     = var.zone
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
}

resource "yandex_compute_instance" "app" {
  name = "reddit-app-${count.index + 1}"

  count = var.count_vms

  resources {
    cores  = 2
    memory = 2
  }

  connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.image_id
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = var.subnet_id
    nat       = true
  }

  provisioner "file" {
    source      = "files/reddit.service"
    destination = "/tmp/reddit.service"
    on_failure = continue
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
    on_failure = continue
  }
}
