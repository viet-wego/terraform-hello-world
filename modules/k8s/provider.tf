provider "kubernetes" {
  host     = "${var.host}"
  username = "${var.user}"
  password = "${var.pwd}"
}
