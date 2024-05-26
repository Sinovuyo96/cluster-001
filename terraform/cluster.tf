####################
# EKS Networking
####################

variable "vpc_id" {
  default = "vpc-0c2777ad1709f46d7"
  type = string
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

# data "aws_subnet" "selected" {
#   for_each = data.aws_vpc.selected.id
#   id       = each.value
# }

# output "selected_subnet_ids" {
#   value = [for subnet in data.aws_subnet.selected : subnet.id]
# }
# resource "aws_subnet" "public-A" {
#   vpc_id     = var.vpc_id
#   cidr_block = "172.31.48.0/20"

#   tags = {
#     Name = "Main"
#   }
# }

# resource "aws_subnet" "public-B" {
#   vpc_id     = var.vpc_id
#   cidr_block = "172.31.16.0/20"

#   tags = {
#     Name = "Main"
#   }
# }

####################
# EKS Cluster
####################

resource "aws_eks_cluster" "rancher-cluster" {
  name     = "Rancher"
  role_arn = aws_iam_role.eks_cluster_and_eks_nodes_role.arn

  vpc_config {
    subnet_ids = ["subnet-073b05c3e735dba6b", "subnet-05222976c49e763cb", "subnet-048287d7fc8d46dd4"]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
  ]
}



output "endpoint" {
  value = aws_eks_cluster.rancher-cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.rancher-cluster.certificate_authority[0].data
}
