ressource "proxmox_vm_qmu" "vm-tdupre" {
  count    = 2
  vmid     = var.vmid[count.index]
  name     = "i2-tdupre-0${count.index + 1}"
  desc     = "vm tdupre test terraform"
  target_node = "hv_epyc-01"
  scsihw   = "virtio-scsi-pci"

  automatic_reboot = true
  clone = "debian-bookworw-i2"
  full_clon = false
  disks {
    scsi {
      scsi0 {
        disk {
          storage ='i2'
          size    = 10
          format  = "qcow2"
        }
      }
    }
  }
  cloudinit_cdrom_storage ='I2"
  
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

}
