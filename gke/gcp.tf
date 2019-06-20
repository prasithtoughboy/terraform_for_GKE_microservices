#####################################################################
# Google Cloud Platform
#####################################################################
provider "google" {
  credentials = "${file("/home/vvdn/Downloads/gcloud-sa.json")}"
  project = "${var.project}"
  region  = "${var.region}"
}
