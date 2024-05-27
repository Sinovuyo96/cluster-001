resource "kubernetes_service_account" "aws_alb_controller_svc_acc" {
  metadata {
    name = "aws-load-balancer-controller"
  }
}

resource "kubernetes_secret" "example" {
  metadata {
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account.aws_alb_controller_svc_acc.metadata.0.name
    }

    generate_name = "aws-alb-ingress-svc-account-secret"
  }

  type                           = "kubernetes.io/service-account-token"
  wait_for_service_account_token = true
}
