resource "kubernetes_deployment" "eiko" {
  metadata {
    name = "eiko"
    labels = {
      App = "ScalableEiko"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "ScalableEiko"
      }
    }
    template {
      metadata {
        labels = {
          App = "ScalableEiko"
        }
      }
      spec {
        container {
          image = "eikoapp/eiko:latest-prod"
          name  = "eiko"

          port {
            container_port = 80
          }
          env {
              name  = "PORT"
              value = "80"
          }
          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "eiko" {
  metadata {
    name = "eiko"
  }
  spec {
    selector = {
      App = kubernetes_deployment.eiko.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

output "lb_ip" {
  value = kubernetes_service.eiko.load_balancer_ingress[0].ip
}