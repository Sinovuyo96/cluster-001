#################################################
# #  ServiceAccount Roles for aws alb controller
# #################################################
# resource "aws_iam_role" "eks_load_balancer_controller_role" {
#   name = var.role_name

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Federated = "arn:aws:iam::381492126797:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/69F476E8726794E5ECBF8219D2617A56"
#         }
#         Action = "sts:AssumeRoleWithWebIdentity"
#         Condition = {
#           StringEquals = {
#             "oidc.eks.us-east-1.amazonaws.com/id/69F476E8726794E5ECBF8219D2617A56:aud" = "sts.amazonaws.com"
#             "oidc.eks.us-east-1.amazonaws.com/id/69F476E8726794E5ECBF8219D2617A56:sub" = "system:serviceaccount:kube-system:aws-load-balancer-controller"
#           }
#         }
#       }
#     ]
#   })
# }

# resource "aws_iam_policy" "svc_acc_policy" {
#   name        = var.svc_acc_policy
#   policy = data.aws_iam_policy_document.eks_load_balancer_controller_policy.json
# }

# resource "aws_iam_policy_attachment" "eks_load_balancer_controller_policy_attachment" {
#    name       = "eks-load-balancer-controller-policy-attachment"
#    policy_arn = aws_iam_policy.svc_acc_policy.arn
#    roles      = [aws_iam_role.eks_load_balancer_controller_role.name]
#  }

#  output "eks_load_balancer_controller_role_arn" {
#    value = aws_iam_role.eks_load_balancer_controller_role.arn
#  }

# # ########################################################
# # # aws alb controller service account policy
# # ########################################################

#  data "aws_iam_policy_document" "eks_load_balancer_controller_policy" {
#    statement {
#     effect    = "Allow"
#     resources = ["*"]
#     actions = [
#                  "ec2:DescribeAccountAttributes",
#                  "ec2:DescribeAddresses",
#                  "ec2:DescribeAvailabilityZones",
#                  "ec2:DescribeInternetGateways",
#                  "ec2:DescribeVpcs",
#                  "ec2:DescribeVpcPeeringConnections",
#                  "ec2:DescribeSubnets",
#                  "ec2:DescribeSecurityGroups",
#                  "ec2:DescribeInstances",
#                  "ec2:DescribeNetworkInterfaces",
#                  "ec2:DescribeTags",
#                  "ec2:GetCoipPoolUsage",
#                  "ec2:DescribeCoipPools",
#                  "ec2:CreateSecurityGroup",
#                  "elasticloadbalancing:DescribeLoadBalancers",
#                  "elasticloadbalancing:DescribeLoadBalancerAttributes",
#                  "elasticloadbalancing:DescribeListeners",
#                  "elasticloadbalancing:DescribeListenerCertificates",
#                  "elasticloadbalancing:DescribeSSLPolicies",
#                  "elasticloadbalancing:DescribeRules",
#                  "elasticloadbalancing:DescribeTargetGroups",
#                  "elasticloadbalancing:DescribeTargetGroupAttributes",
#                  "elasticloadbalancing:DescribeTargetHealth",
#                  "elasticloadbalancing:DescribeTags",
#                  "elasticloadbalancing:DescribeTrustStores",
#                  "cognito-idp:DescribeUserPoolClient",
#                  "acm:ListCertificates",
#                  "acm:DescribeCertificate",
#                  "iam:ListServerCertificates",
#                  "iam:GetServerCertificate",
#                  "waf-regional:GetWebACL",
#                  "waf-regional:GetWebACLForResource",
#                  "waf-regional:AssociateWebACL",
#                  "waf-regional:DisassociateWebACL",
#                  "wafv2:GetWebACL",
#                  "wafv2:GetWebACLForResource",
#                  "wafv2:AssociateWebACL",
#                  "wafv2:DisassociateWebACL",
#                  "shield:GetSubscriptionState",
#                  "shield:DescribeProtection",
#                  "shield:CreateProtection",
#                  "shield:DeleteProtection",
#                  "ec2:AuthorizeSecurityGroupIngress",
#                  "ec2:RevokeSecurityGroupIngress",
                
#      ]
#    }
  
#    statement {
#     effect    = "Allow"
#     resources = ["*"]
#     actions = [
#                    "ec2:DescribeAccountAttributes",
#                    "ec2:DescribeAddresses",
#                    "ec2:DescribeAvailabilityZones",
#                    "ec2:DescribeInternetGateways",
#                    "ec2:DescribeVpcs",
#                    "ec2:DescribeVpcPeeringConnections",
#                    "ec2:DescribeSubnets",
#                    "ec2:DescribeSecurityGroups",
#                    "ec2:DescribeInstances",
#                    "ec2:DescribeNetworkInterfaces",
#                    "ec2:DescribeTags",
#                    "ec2:GetCoipPoolUsage",
#                    "ec2:DescribeCoipPools",
#                    "elasticloadbalancing:DescribeLoadBalancers",
#                    "elasticloadbalancing:DescribeLoadBalancerAttributes",
#                    "elasticloadbalancing:DescribeListeners",
#                    "elasticloadbalancing:DescribeListenerCertificates",
#                    "elasticloadbalancing:DescribeSSLPolicies",
#                    "elasticloadbalancing:DescribeRules",
#                    "elasticloadbalancing:DescribeTargetGroups",
#                    "elasticloadbalancing:DescribeTargetGroupAttributes",
#                    "elasticloadbalancing:DescribeTargetHealth",
#                    "elasticloadbalancing:DescribeTags",
#                    "elasticloadbalancing:DescribeTrustStores",
#                    "ec2:AuthorizeSecurityGroupIngress",
#                    "ec2:RevokeSecurityGroupIngress",
#                    "elasticloadbalancing:CreateListener",
#                    "elasticloadbalancing:DeleteListener",
#                    "elasticloadbalancing:CreateRule",
#                    "elasticloadbalancing:DeleteRule",
#                    "ec2:CreateSecurityGroup"
                  
#        ]
#      }

#   statement {
#    effect    = "Allow"
#    resources = ["*"]
#    actions = [
#                  "cognito-idp:DescribeUserPoolClient",
#                  "acm:ListCertificates",
#                  "acm:DescribeCertificate",
#                  "iam:ListServerCertificates",
#                  "iam:GetServerCertificate",
#                  "waf-regional:GetWebACL",
#                  "waf-regional:GetWebACLForResource",
#                  "waf-regional:AssociateWebACL",
#                  "waf-regional:DisassociateWebACL",
#                  "wafv2:GetWebACL",
#                  "wafv2:GetWebACLForResource",
#                  "wafv2:AssociateWebACL",
#                  "wafv2:DisassociateWebACL",
#                  "shield:GetSubscriptionState",
#                  "shield:DescribeProtection",
#                  "shield:CreateProtection",
#                  "shield:DeleteProtection"
                  
#        ]
#      }

#   statement {
#    effect    = "Allow"
#    resources = ["*"]
#    actions = [
#                  "cognito-idp:DescribeUserPoolClient",
#                  "acm:ListCertificates",
#                  "acm:DescribeCertificate",
#                  "iam:ListServerCertificates",
#                  "iam:GetServerCertificate",
#                  "waf-regional:GetWebACL",
#                  "waf-regional:GetWebACLForResource",
#                  "waf-regional:AssociateWebACL",
#                  "waf-regional:DisassociateWebACL",
#                  "wafv2:GetWebACL",
#                  "wafv2:GetWebACLForResource",
#                  "wafv2:AssociateWebACL",
#                  "wafv2:DisassociateWebACL",
#                  "shield:GetSubscriptionState",
#                  "shield:DescribeProtection",
#                  "shield:CreateProtection",
#                  "shield:DeleteProtection"
                  
#        ]
#      }

# statement {
#     effect    = "Allow"
#     resources = ["*"]
#     actions   = ["ec2:AttachVolume"]
#     condition {
#       test     = "StringEquals"
#       variable = "iam:AWSServiceName" 
#       values = ["elasticloadbalancing.amazonaws.com"]
#     }
#   }
# }
