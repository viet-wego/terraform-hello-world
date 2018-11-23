resource "kubernetes_service" "jenkins-ui" {
  metadata {
    name      = "jenkins-ui"
    namespace = "${kubernetes_namespace.infra.metadata.0.name}"
  }

  spec {
    selector {
      name = "${var.jenkins_name}"
    }

    port {
      port        = 8080
      target_port = 8080
      protocol    = "TCP"
    }

    type             = "LoadBalancer"
    load_balancer_ip = "${var.jenkins_ip}"
  }
}

resource "kubernetes_service" "jenkins-discovery" {
  metadata {
    name      = "jenkins-discovery"
    namespace = "${kubernetes_namespace.infra.metadata.0.name}"
  }

  spec {
    selector {
      name = "${var.jenkins_name}"
    }

    port {
      port        = 50000
      target_port = 50000
      protocol    = "TCP"
    }

    type = "ClusterIP"
  }
}

output "jenkins_url" {
  value = "${var.jenkins_ip}:8080"
}
