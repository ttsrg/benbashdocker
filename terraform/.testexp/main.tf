/*
resource "google_storage_bucket" "tf_state" {
  name     = "newtest_tf_state"
  location = "EU"

  ######
  //        force_destroy = true
}
*/


terraform {
  backend "gcs" {
      bucket = "newtest_tf_state"
          //    bucket = "${google_storage_bucket.tf_state.name}"
              prefix = "state-file-project-ben"
                }
                }
                

provider "google" {
  credentials = "${file("${var.credentials_file_path}")}"
  project     = var.project_name
  #  region      = "${var.region}"
  #  zone        = var.zone
}



