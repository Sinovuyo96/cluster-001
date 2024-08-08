####################
# EKS Networking
####################

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

resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_and_eks_nodes_role.arn
  version = "1.27"

  vpc_config {
    subnet_ids = var.subnet_ids
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
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.dev_cluster.certificate_authority[0].data
}
