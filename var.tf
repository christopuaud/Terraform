variable "node_name"{
  description = "proxmox cluster nodes"
  type        = list(string)
  default     = [
    "hv-epyc-01",
    "hv-epyc-02",
  ]
}

variable "vmid"{
  description = "VMs VMIDs"
  type        = list(string)
  default     = [
    "5022",
    "5023",
  ]
}

variable "ipaddresses"{
  description = "VMs IP addresses"
  type        = list(string)
  default     = [
    "172.16.152.22",
    "172.16.152.23",
  ]
}

variable "cidr"{
  description = "CIDR VLAN LABO"
  default     = "16"
}
