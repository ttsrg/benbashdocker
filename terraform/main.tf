// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("~/.ssh/gerritben-055589b85549.json")}"
  project     = "gerritben"
   region      = "us-west1"
   }
   