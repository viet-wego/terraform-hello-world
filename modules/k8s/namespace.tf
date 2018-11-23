resource "kubernetes_namespace" "infra" {
  metadata {
    name = "infra"
  }
}

resource "kubernetes_limit_range" "infra" {
  metadata {
    name      = "infra-limits"
    namespace = "${kubernetes_namespace.infra.metadata.0.name}"
  }

  spec {
    limit {
      type = "Container"

      default {
        cpu    = "800m"
        memory = "2.5Gi"
      }

      default_request {
        cpu    = "500m"
        memory = "2Gi"
      }

      min {
        cpu    = "100m"
        memory = "1Gi"
      }

      max {
        cpu    = "900m"
        memory = "3Gi"
      }
    }
  }
}
