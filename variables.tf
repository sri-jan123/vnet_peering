variable "subscription_id" {
  type = string
}

variable "rg_name" {
  type    = string
  default = "rg-project2"
}

variable "rg_location" {
  type    = string
  default = "east us"
}

variable "vnet_name" {
  type    = list(string)
  default = ["peer1-vnet", "peer2-vnet"]
}

variable "subnet_name" {
  type    = list(string)
  default = ["peer1-sn", "peer2-sn"]
}

variable "peering_name" {
  type    = list(string)
  default = ["peer1to2", "peer2to1"]
}

variable "address_sp" {
  type    = tuple([string, string, number, number])
  default = ["10.0.0.0", "10.1.0.0", 16, 24]
}

variable "nic_name" {
  type    = list(string)
  default = ["peer1-nic", "peer2-nic"]
}

variable "vm_name" {
  type    = list(string)
  default = ["peer-vm", "peer2-vm"]
}

variable "disk_size" {
  type    = string
  default = "Standard_D2ads_v7"
}

