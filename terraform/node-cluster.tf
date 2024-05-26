########################
# eks node group
########################
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.rancher-cluster.name
  node_group_name = "node-js-group"
  node_role_arn   = aws_iam_role.eks_cluster_and_eks_nodes_role.arn
  subnet_ids = ["subnet-03512810012d64335", "subnet-0b24fcd08215dc4e6", "subnet-0086c1e53a670dffd"]
#  subnet_ids      = aws_subnet.example[*].id

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy
  ]
}