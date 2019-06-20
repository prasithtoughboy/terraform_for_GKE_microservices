resource "kubernetes_service" "emailservice" {
  metadata {
    name = "emailservice"
  }

  spec {
    type = "ClusterIP"
    selector {
      app  = "emailservice"
    }
    port {
      port        = 5000
      target_port = 8080
    }
  }
}

resource "kubernetes_service" "checkoutservice" {
  metadata {
    name = "checkoutservice"
  }

  spec {
    type = "ClusterIP"
    selector {
      app  = "checkoutservice"
    }
    port {
      port        = 5050
      target_port = 5050
    }
  }
}

resource "kubernetes_service" "recommendationservice" {
  metadata {
    name = "recommendationservice"
  }

  spec {
    type = "ClusterIP"
    selector {
      app  = "recommendationservice"
    }
    port {
      port        = 8080
      target_port = 8080
    }
  }
}

resource "kubernetes_service" "frontend" {
  metadata {
    name = "frontend"
  }

  spec {
    type = "ClusterIP"
    selector {
      app  = "frontend"
    }
    port {
      port        = 80
      target_port = 8080
    }
  }
}

resource "kubernetes_service" "frontend-external" {
  metadata {
    name = "frontend-external"
  }

  spec {
    type = "LoadBalancer"
    selector {
      app  = "frontend"
    }
    port {
      port        = 80
      target_port = 8080
    }
  }
}

resource "kubernetes_service" "paymentservice" {
  metadata {
    name = "paymentservice"
  }

  spec {
    type = "ClusterIP"
    selector {
      app  = "paymentservice"
    }
    port {
      port        = 50051
      target_port = 50051
    }
  }
}

resource "kubernetes_service" "productcatalogservice" {
  metadata {
    name = "productcatalogservice"
  }

  spec {
    type = "ClusterIP"
    selector {
      app  = "productcatalogservice"
    }
    port {
      port        = 3550
      target_port = 3550
    }
  }
}

resource "kubernetes_service" "cartservice" {
  metadata {
    name = "cartservice"
  }

  spec {
    type = "ClusterIP"
    selector {
      app  = "cartservice"
    }
    port {
      port        = 7070
      target_port = 7070
    }
  }
}

resource "kubernetes_service" "currencyservice" {
  metadata {
    name = "currencyservice"
  }

  spec {
    type = "ClusterIP"
    selector {
      app  = "currencyservice"
    }
    port {
      port        = 7000
      target_port = 7000
    }
  }
}

resource "kubernetes_service" "shippingservice" {
  metadata {
    name = "shippingservice"
  }

  spec {
    type = "ClusterIP"
    selector {
      app  = "shippingservice"
    }
    port {
      port        = 50051
      target_port = 50051
    }
  }
}


resource "kubernetes_service" "adservice" {
  metadata {
    name = "adservice"
  }

  spec {
    type = "ClusterIP"
    selector {
      app  = "adservice"
    }
    port {
      port        = 9555
      target_port = 9555
    }
  }
}
