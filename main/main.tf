variable "key_file" {}
variable "project" {}
variable "zone" {}
variable "cluster_user" {}
variable "cluster_pwd" {}

module "gcp" {
  source = "../modules/gcp"

  key_file     = "${var.key_file}"
  project      = "${var.project}"
  zone         = "${var.zone}"
  cluster_user = "${var.cluster_user}"
  cluster_pwd  = "${var.cluster_pwd}"
}

module "k8s" {
  source     = "../modules/k8s"
  host       = "${module.gcp.cluster_endpoint}"
  user       = "${module.gcp.cluster_username}"
  pwd        = "${module.gcp.cluster_password}"
  ca_cert    = "${module.gcp.cluster_ca_cert}"
  gce_disk   = "${module.gcp.disk}"
  jenkins_ip = "${module.gcp.static_address}"
}
