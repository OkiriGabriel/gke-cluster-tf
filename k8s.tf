resource "kubernetes_deployment" "api" {
  metadata {
    name = "time-api"
    labels = {
      app = "time-api"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "time-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "time-api"
        }
      }

      spec {
        container {
          image = "shortlet:latest"
          name  = "time-api"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "api" {
  metadata {
    name = "time-api-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment.api.metadata[0].labels.app
    }
    port {
      port        = 80
      target_port = 8080
    }
    type = "LoadBalancer"
  }
}