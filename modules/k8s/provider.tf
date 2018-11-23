provider "kubernetes" {
  host                   = "${var.host}"
  username               = "${var.user}"
  password               = "${var.pwd}"
  cluster_ca_certificate = "${var.ca_cert}"
}
