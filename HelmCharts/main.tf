provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "medfast-frontend" {
  name       = "medfast-frontend"
  chart      = "${path.module}/frontapp"
  namespace  = "default"

  values = [
    file("${path.module}/frontapp/values.yaml")
  ]
}