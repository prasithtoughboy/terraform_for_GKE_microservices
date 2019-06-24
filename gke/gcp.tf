#####################################################################
# Google Cloud Platform
#####################################################################
provider "google" {
  credentials = "${file("gcloud-sa.json")}"
  project = "${var.project}"
  region  = "${var.region}"
}
