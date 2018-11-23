variable "host" {}
variable "user" {}
variable "pwd" {}
variable "ca_cert" {}
variable "gce_disk" {}
variable "jenkins_ip" {}

variable "jenkins_name" {
  default = "jenkins-master"
}

variable "volume_name" {
  default = "jenkins-home"
}
