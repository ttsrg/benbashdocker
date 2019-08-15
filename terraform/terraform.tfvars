credentials_file_path = "~/.gcloud/terraform.json"

project_name = "gerritben"



vregion = "region-1"

mregions = {
  region-0 = "europe-west1"
  region-1 = "us-central1"
}


mregion_ip_cidr_range = {
  europe-west1 = "10.10.10.0/24"
  us-central1  = "10.11.11.0/24"
}

//net = "public"

lnet               = ["private", "db", "public"]
lnet_ip_cidr_range = ["10.10.10.0/24", "10.11.11.0/29", "172.16.16.0/29"]
/*
mnet_ip_cidr_range = {
  private = "10.10.10.0/24"
  db      = "10.11.11.0/29"
  public  = "172.16.16.0/29"
}
*/


vms_count = "1"

instances_name = "vm"




mimage = {
  europe-west1 = "centos-cloud/centos-7"
  us-central1  = "debian-cloud/debian-9"
}



mdisk_size = {
  europe-west1 = "10"
  us-central1  = "11"

}




mzones = {

  europe-west1 = "europe-west1-c"
  us-central1  = "us-central1-f"
}





