
variable "ports_number" {
  default = ["22", "80"]
}

variable "vregion" {
  default = ""
}


variable "lnet" {
  default = []
}


variable "mregion_ip_cidr_range" {
  ###interesting bug or feature
  default = []
}
variable "ip_cidr_range_2" {
  default = ""
}


variable "mregions" {
  default = {}
}
                