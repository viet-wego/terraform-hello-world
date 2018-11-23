resource "kubernetes_deployment" "jenkins-master" {
  metadata {
    name      = "${var.jenkins_name}"
    namespace = "${kubernetes_namespace.infra.metadata.0.name}"

    labels {
      name = "${var.jenkins_name}"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        name = "${var.jenkins_name}"
      }
    }

    strategy {
      type = "RollingUpdate"

      rolling_update {
        max_surge       = 1
        max_unavailable = 0
      }
    }

    template {
      metadata {
        labels {
          name = "${var.jenkins_name}"
        }
      }

      spec {
        container {
          image = "jenkins/jenkins:2.138.2"
          name  = "${var.jenkins_name}"

          port = [
            {
              container_port = 8080
              protocol       = "TCP"
            },
            {
              container_port = 50000
              protocol       = "TCP"
            },
          ]

          env {
            name  = "JAVA_OPTS"
            value = "-Xmx1536m -Dhudson.slaves.NodeProvisioner.initialDelay=0 -Dhudson.slaves.NodeProvisioner.MARGIN=50 -Dhudson.slaves.NodeProvisioner.MARGIN0=0.85"
          }

          readiness_probe {
            failure_threshold = 5
            success_threshold = 2
            timeout_seconds   = 5
            period_seconds    = 10

            http_get {
              path = "/login"
              port = 8080
            }
          }

          resources {
            limits {
              cpu    = "800m"
              memory = "2.5Gi"
            }

            requests {
              cpu    = "500m"
              memory = "2Gi"
            }
          }

          volume_mount {
            mount_path = "/var/jenkins_home"
            name       = "${var.volume_name}"
          }
        }

        service_account_name = "${kubernetes_service_account.jenkins.metadata.0.name}"

        volume {
          name = "${var.volume_name}"

          persistent_volume_claim {
            claim_name = "${kubernetes_persistent_volume_claim.jenkins.metadata.0.name}"
          }
        }
      }
    }
  }
}
