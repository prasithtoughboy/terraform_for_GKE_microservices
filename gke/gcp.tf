#####################################################################
# Google Cloud Platform
#####################################################################
provider "google" {
  credentials = "${file("gke/gcloud-sa.json")}"
  project = "${var.project}"
  region  = "${var.region}"
}
