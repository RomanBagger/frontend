variable "image_tag" {
  description = "Docker image tag"
  type        = string
}

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

  set {
    name  = "image.tag"
    value = var.image_tag 
  }

  atomic         = true      
  recreate_pods  = true      
  cleanup_on_fail = true      
  force_update   = true     

  wait           = true
}
