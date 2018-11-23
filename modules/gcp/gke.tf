variable "node_count" {
  default = 3
}

resource "google_container_cluster" "jenkins" {
  name               = "jenkins-cluster"
  initial_node_count = "${var.node_count}"

  master_auth {
    username = "${var.cluster_user}"
    password = "${var.cluster_pwd}"
  }
}

output "cluster_endpoint" {
  value = "${google_container_cluster.jenkins.endpoint}"
}

output "cluster_username" {
  value = "${google_container_cluster.jenkins.master_auth.0.username}"
}

output "cluster_password" {
  value = "${google_container_cluster.jenkins.master_auth.0.password}"
}

output "cluster_ca_cert" {
  value = "${base64decode(google_container_cluster.jenkins.master_auth.0.cluster_ca_certificate)}"
}
