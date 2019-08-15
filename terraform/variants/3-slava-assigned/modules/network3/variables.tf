
variable "ports_number" {
  default = ["22", "80"]
}

variable "vregion" {
  default = ""
}


variable "mregion_ip_cidr_range" {
  ###interesting bug or feature
  default = []
}



variable "mregions" {
  default = {}
}
                