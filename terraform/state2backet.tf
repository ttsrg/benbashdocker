
terraform {
  backend "gcs" {
    bucket = "ben_manual"
    //    bucket = "${google_storage_bucket.tf_state.name}"
    //    prefix = "state-file-project-ben"
  }
}

