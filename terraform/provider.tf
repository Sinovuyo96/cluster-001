provider aws {
  region = "us-east-1"
}

provider "kubernetes" {
#  config_path    = "~/.kube/config"
#  config_context = "current-context"
}

#resource "kubernetes_namespace" "nginx-ns" {
#  metadata {
#    name = "nginx"
#  }
#}
