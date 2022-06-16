resource "kubernetes_namespace" "tfc_agents_namespace" {
  metadata {
    annotations = {
      name = "${var.tfc_agent_name}-annotation"
    }

    labels = var.labels

    name = var.tfc_agent_namespace
  }
}


resource "kubernetes_deployment" "tfc_agents" {
  depends_on = [kubernetes_namespace.tfc_agents_namespace]
  metadata {
    name      = var.tfc_agent_name
    namespace = var.tfc_agent_namespace
    labels = {
      app = "tfc-agent"
    }
  }
  spec {
    selector {
      match_labels = {
        app = "tfc-agent"
      }
    }

    replicas = 1
    template {
      metadata {
        labels = {
          app = "tfc-agent"
        }
        annotations = {
          "sidecar.istio.io/inject" = "false"
        }
      }
      spec {
        container {
          image = "hashicorp/tfc-agent:latest"
          name  = var.tfc_agent_name
          env {
            name  = "TFC_AGENT_TOKEN"
            value = var.tfc_agent_token
          }
          env {
            name  = "TFC_AGENT_NAME"
            value = var.tfc_agent_name
          }
          env {
            name  = "TFC_AGENT_LOG_LEVEL"
            value = "DEBUG"
          }
          resources {
            limits = {
              cpu    = "2"
              memory = "4Gi"
            }
            requests = {
              cpu    = "1"
              memory = "2Gi"
            }
          }
        }
        volume {
          name = "${var.tfc_agent_name}-volume"
          empty_dir {}
        }
      }
    }
  }
}


resource "kubernetes_secret" "tfc_agent_token" {
  depends_on = [kubernetes_namespace.tfc_agents_namespace]
  metadata {
    name      = "${var.tfc_agent_name}-secret"
    namespace = var.tfc_agent_namespace
  }

  data = {
    username = var.tfc_agent_name
    password = "${var.tfc_agent_token}"
  }

  type = "kubernetes.io/basic-auth"
}
