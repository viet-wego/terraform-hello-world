provider "google" {
  credentials = "${file("${var.key_file}")}"

  project = "${var.project}"
  zone    = "${var.zone}"
}
