resource "kubernetes_replication_controller" "emailservice" {
  metadata {
    name = "emailservice"
    labels {
       app = "emailservice"
         }
  }

  spec {
    replicas = 1
    selector {
      app = "emailservice"
    }
    template {

        container {
          image = "gcr.io/google-samples/microservices-demo/emailservice:v0.1.1"
          name  = "server"
          port {
                  container_port = 8080
                }
          env {
                  name = "PORT"
                  value = "8080"
              }
          env {
                  name = "ENABLE_PROFILER"
                  value = "0"
              }
          resources{
            limits{
              cpu    = "200m"
              memory = "128Mi"
            }
            requests{
              cpu    = "100m"
              memory = "64Mi"
            }
          }
        }
    }
  }
}

resource "kubernetes_replication_controller" "checkoutservice" {
  metadata {
    name = "checkoutservice"
    labels {
       app = "checkoutservice"
         }
  }

  spec {
    replicas = 1
    selector {
      app = "checkoutservice"
    }
    template {


        container {
          image = "gcr.io/google-samples/microservices-demo/checkoutservice:v0.1.1"
          name  = "server"
          port {
                  container_port = 5050
                }
          env {
                  name = "PORT"
                  value = "5050"
              }
          env {
                  name = "PRODUCT_CATALOG_SERVICE_ADDR"
                  value = "productcatalogservice:3550"
              }
          env {
                  name = "SHIPPING_SERVICE_ADDR"
                  value = "shippingservice:50051"
              }
          env {
                  name = "PAYMENT_SERVICE_ADDR"
                  value = "paymentservice:50051"
              }
          env {
                  name = "EMAIL_SERVICE_ADDR"
                  value = "emailservice:5000"
              }
          env {
                  name = "CURRENCY_SERVICE_ADDR"
                  value = "currencyservice:7000"
              }
          env {
                  name = "CART_SERVICE_ADDR"
                  value = "cartservice:7070"
              }
          resources{
            limits{
              cpu    = "200m"
              memory = "128Mi"
            }
            requests{
              cpu    = "100m"
              memory = "64Mi"
            }
          }
        }
      }
  }
}

resource "kubernetes_replication_controller" "recommendationservice" {
  metadata {
    name = "recommendationservice"
    labels {
       app = "recommendationservice"
         }
  }

  spec {
    replicas = 1
    selector {
      app = "recommendationservice"
    }
    template {
        container {
          image = "gcr.io/google-samples/microservices-demo/recommendationservice:v0.1.1"
          name  = "server"
          port {
                  container_port = 8080
                }
          env {
                  name = "PORT"
                  value = "8080"
              }
          env {
                  name = "PRODUCT_CATALOG_SERVICE_ADDR"
                  value = "productcatalogservice:3550"
              }
          env {
                  name = "ENABLE_PROFILER"
                  value = "0"
              }
          resources{
            limits{
              cpu    = "200m"
              memory = "450Mi"
            }
            requests{
              cpu    = "100m"
              memory = "220Mi"
            }
          }
        }
    }
  }
}

resource "kubernetes_replication_controller" "frontend" {
  metadata {
    name = "frontend"
    labels {
       app = "frontend"
         }
  }

  spec {
    replicas = 1
    selector {
      app = "frontend"
    }
    template {

        container {
          image = "gcr.io/google-samples/microservices-demo/frontend:v0.1.1"
          name  = "server"
          port {
                  container_port = 8080
                }
          env {
                  name = "PORT"
                  value = "8080"
              }
          env {
                  name = "PRODUCT_CATALOG_SERVICE_ADDR"
                  value = "productcatalogservice:3550"
              }
          env {
                  name = "CURRENCY_SERVICE_ADDR"
                  value = "currencyservice:7000"
              }
          env {
                  name = "CART_SERVICE_ADDR"
                  value = "cartservice:7070"
              }
          env {
                  name = "RECOMMENDATION_SERVICE_ADDR"
                  value = "recommendationservice:8080"
              }
          env {
                  name = "SHIPPING_SERVICE_ADDR"
                  value = "shippingservice:50051"
              }
          env {
                  name = "CHECKOUT_SERVICE_ADDR"
                  value = "checkoutservice:5050"
              }
          env {
                  name = "AD_SERVICE_ADDR"
                  value = "adservice:9555"
              }
          liveness_probe {
            initial_delay_seconds = 10
            http_get {
               path = "/_healthz"
               port = 8080
                 
            http_header {
              name  = "Cookie"
              value = "shop_session-id=x-liveness-probe"
               }
             }
          }
          resources{
            limits{
              cpu    = "200m"
              memory = "128Mi"
            }
            requests{
              cpu    = "100m"
              memory = "64Mi"
            }
          }
        }
    }
  }
}

resource "kubernetes_replication_controller" "paymentservice" {
  metadata {
    name = "paymentservice"
    labels {
       app = "paymentservice"
         }
  }

  spec {
    replicas = 1
    selector {
      app = "paymentservice"
    }
    template {

        container {
          image = "gcr.io/google-samples/microservices-demo/paymentservice:v0.1.1"
          name  = "server"
          port {
                  container_port = 50051
                }
          env {
                  name = "PORT"
                  value = "50051"
              }
          resources{
            limits{
              cpu    = "200m"
              memory = "128Mi"
            }
            requests{
              cpu    = "100m"
              memory = "64Mi"
            }
          }
        }
    }
  }
}

resource "kubernetes_replication_controller" "productcatalogservice" {
  metadata {
    name = "productcatalogservice"
    labels {
       app = "productcatalogservice"
         }
  }

  spec {
    replicas = 1
    selector {
      app = "productcatalogservice"
    }
    template {

        container {
          image = "gcr.io/google-samples/microservices-demo/productcatalogservice:v0.1.1"
          name  = "server"
          port {
                  container_port = 3550
                }
          env {
                  name = "PORT"
                  value = "3550"
              }
          resources{
            limits{
              cpu    = "200m"
              memory = "128Mi"
            }
            requests{
              cpu    = "100m"
              memory = "64Mi"
            }
          }
        }
    }
  }
}

resource "kubernetes_replication_controller" "cartservice" {
  metadata {
    name = "cartservice"
    labels {
       app = "cartservice"
         }
  }

  spec {
    replicas = 2
    selector {
      app = "cartservice"
    }
    template {

        container {
          image = "gcr.io/google-samples/microservices-demo/cartservice:v0.1.1"
          name  = "server"
          port {
                  container_port = 7070
                }
          env {
                  name = "PORT"
                  value = "7070"
              }
          env {
                  name = "LISTEN_ADDR"
                  value = "0.0.0.0"
              }
          resources{
            limits{
              cpu    = "300m"
              memory = "200Mi"
            }
            requests{
              cpu    = "200m"
              memory = "100Mi"
            }
          }
        }
    }
  }
}

resource "kubernetes_replication_controller" "currencyservice" {
  metadata {
    name = "currencyservice"
    labels {
       app = "currencyservice"
         }
  }

  spec {
    replicas = 1
    selector {
      app = "currencyservice"
    }
    template {

        container {
          image = "gcr.io/google-samples/microservices-demo/currencyservice:v0.1.1"
          name  = "server"
          port {
                  container_port = 7000
                }
          env {
                  name = "PORT"
                  value = "7000"
              }
          resources{
            limits{
              cpu    = "200m"
              memory = "128Mi"
            }
            requests{
              cpu    = "100m"
              memory = "64Mi"
            }
          }
        }
    }
  }
}

resource "kubernetes_replication_controller" "shippingservice" {
  metadata {
    name = "shippingservice"
    labels {
       app = "shippingservice"
         }
  }

  spec {
    replicas = 1
    selector {
      app = "shippingservice"
    }
    template {

        container {
          image = "gcr.io/google-samples/microservices-demo/shippingservice:v0.1.1"
          name  = "server"
          port {
                  container_port = 50051
                }
          env {
                  name = "PORT"
                  value = "50051"
              }
          resources{
            limits{
              cpu    = "200m"
              memory = "128Mi"
            }
            requests{
              cpu    = "100m"
              memory = "64Mi"
            }
          }
        }
    }
  }
}

resource "kubernetes_replication_controller" "adservice" {
  metadata {
    name = "adservice"
    labels {
       app = "adservice"
         }
  }

  spec {
    replicas = 1
    selector {
      app = "adservice"
    }
    template {

        container {
          image = "gcr.io/google-samples/microservices-demo/adservice:v0.1.1"
          name  = "server"
          port {
                  container_port = 9555
                }
          env {
                  name = "PORT"
                  value = "9555"
              }
          resources{
            limits{
              cpu    = "300m"
              memory = "300Mi"
            }
            requests{
              cpu    = "200m"
              memory = "180Mi"
            }
          }
        }
    }
  }
}
