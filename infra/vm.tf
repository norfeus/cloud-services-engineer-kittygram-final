data "yandex_compute_image" "image" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "vm_1" {
  name     = var.vm_1_name
  hostname = var.vm_1_name
  zone     = var.zone
  platform_id = var.platform_id

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      type     = var.disk_type
      image_id = data.yandex_compute_image.image.id
      size     = var.disk_size
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.infra_subnet[0].id
    nat                = var.nat
    security_group_ids = [yandex_vpc_security_group.infra_sg.id]
  }

  metadata = {
    serial-port-enable = "1"
    user-data = templatefile("${path.module}/init/vm-install.yml", {
      ssh_key_pub = var.ssh_key_pub
   })
  }
}