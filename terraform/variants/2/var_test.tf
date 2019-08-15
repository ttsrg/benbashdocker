variable "vm_region" {
  default = ["us-central1", "asia-northeast2"]
}

variable "region_ip_cidr_range" {
  type = "map"
  default = {
    us-central1     = "10.10.10.0/24"
    asia-northeast2 = "192.168.168.0/24"
  }
}
        