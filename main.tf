terraform {
        required_providers {
                proxmox = {
                        source = "telmate/proxmox"
                        version = "3.0.1- rc3"
                }
        }
}

provider "proxmox" {
        pm tls insecure = true
        pm api url "https://proxmox.labo.loc/ap12/json"
        pm parallel "2"
}
