variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "kittygram-network"
}

variable "net_cidr" {
  description = "Subnet structure"
  type = list(object({
    name   = string
    zone   = string
    prefix = string
  }))
  default = [
    { name = "kittygram-subnet-a", zone = "ru-central1-a", prefix = "192.168.10.0/24" },
    { name = "kittygram-subnet-b", zone = "ru-central1-b", prefix = "192.168.11.0/24" },
    { name = "kittygram-subnet-d", zone = "ru-central1-d", prefix = "192.168.12.0/24" },
  ]
}

variable "vm_1_name" {
  type    = string
  default = "kittygram-vm"
}

variable "zone" {
  description = "Zone for VM deployment"
  type        = string
  default     = "ru-central1-a"
}

variable "platform_id" {
  description = "Platform ID for VM"
  type        = string
  default     = "standard-v1"
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Amount of RAM in GB"
  type        = number
  default     = 2
}

variable "disk_type" {
  description = "Disk type"
  type        = string
  default     = "network-ssd"
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 20
}

variable "nat" {
  description = "Enable NAT for internet access"
  type        = bool
  default     = true
}

variable "ssh_key" {
  description = "SSH Public Key"
  type        = string
}

variable "cloud_id" {
  description = "Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Folder ID"
  type        = string
}