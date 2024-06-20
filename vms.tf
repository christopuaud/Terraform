resource "proxmox_vm_qemu" "vm-cpuaud" {
  count       = 2
  vmid        = var.vmid[count.index]
  name        = var.vmname[count.index]
  desc        = "vm cpuaud test terraform"
  target_node = var.node_name[count.index]
  scsihw      = "virtio-scsi-pci"

  automatic_reboot = true
  clone            = "debian-bookworm-i2"
  full_clone       = false
  disks {
    scsi {
      scsi0 {
        disk {
          storage = "I2"
          size    = 15
          format  = "qcow2"
        }
      }
    }
    ide {
      ide3 {
        cloudinit {
          storage = "I2"
        }
      }
    }
  }


  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  cpu       = "x86-64-v2-AES"
  cores     = 2
  memory    = 4096
  os_type   = "cloud-init"
  ciuser    = "chris"
  sshkeys   = <<EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAVQR9xqy6J0EC4CUs4ReKLQA48XHZwAY/tKkvhadiLS chris@raspberrypiChris
EOF
  ipconfig0 = "ip=${var.ipaddresses[count.index]}/${var.cidr},gw=172.16.255.254"
}
