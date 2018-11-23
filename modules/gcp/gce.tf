resource "google_compute_disk" "jenkins-master" {
  name = "tf-jenkins-master"
  type = "pd-ssd"
  size = 64
}

resource "google_compute_address" "jenkins-static" {
  name = "jenkins-master-static"
}

output "disk" {
  value = "${google_compute_disk.jenkins-master.name}"
}

output "static_address" {
  value = "${google_compute_address.jenkins-static.address}"
}
