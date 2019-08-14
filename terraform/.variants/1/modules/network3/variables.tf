
variable "ports_number" {
default =  ["22", "80"]
}

variable "vregion" {
default =  ""
}

/*
variable  "region_ip_cidr_range" {
type = "map"
  default = {
  us-central1 = "10.10.10.0/24"
  asia-northeast2 = "192.168.168.0/24"
  }
}
*/

variable  "mregion_ip_cidr_range" {
##type = "map"
  default = []
        }
        


variable "mregions" {
  type = "map"
  default = {}
                }
                