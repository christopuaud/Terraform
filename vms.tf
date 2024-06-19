ressource "proxmox_vm_qmu" "vm-tdupre" {
  count    = 2
  vmid     = var.vmid[count.index]
}
