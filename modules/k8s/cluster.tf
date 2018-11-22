resource "kubernetes_service_account" "jenkins" {
  metadata {
    name      = "jenkins"
    namespace = "${kubernetes_namespace.infra.metadata.0.name}"
  }
}

resource "kubernetes_cluster_role_binding" "jenkins" {
  metadata {
    name = "jenkins"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "${kubernetes_service_account.jenkins.metadata.0.name}"
    namespace = "${kubernetes_namespace.infra.metadata.0.name}"
  }
}
