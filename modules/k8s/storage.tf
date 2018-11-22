resource "kubernetes_persistent_volume" "jenkins" {
  metadata {
    name = "jenkins"
  }

  spec {
    capacity {
      storage = "64Gi"
    }

    access_modes = ["ReadWriteMany"]

    persistent_volume_source {
      gce_persistent_disk {
        pd_name = "${var.gce_disk}"
        fs_type = "ext4"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "jenkins" {
  metadata {
    name      = "jenkins"
    namespace = "${kubernetes_namespace.infra.metadata.0.name}"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests {
        storage = "64Gi"
      }
    }

    volume_name = "${kubernetes_persistent_volume.jenkins.metadata.0.name}"
  }
}
