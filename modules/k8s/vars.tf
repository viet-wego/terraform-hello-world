variable "host" {}
variable "user" {}
variable "pwd" {}
variable "gce_disk" {}

variable "jenkins_name" {
  default = "jenkins-master"
}

variable "volume_name" {
  default = "jenkins-home"
}
