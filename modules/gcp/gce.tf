resource "google_compute_disk" "jenkins-master" {
  name = "tf-jenkins-master"
  type = "pd-ssd"
  size = 64
}

output "disk" {
  value = "${google_compute_disk.jenkins-master.name}"
}
