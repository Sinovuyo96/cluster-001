##############
# EKS Policy #
##############
resource "aws_iam_policy" "eks_policy" {
  policy      = data.aws_iam_policy_document.eks_iam_policy_doc.json
  name        = "eks_policy"
  path        = "/"
  description = "eks policy"
  depends_on = [
      aws_s3_bucket.terraform_state
    ]
}
############
# EKS ROLE #
############

resource "aws_iam_role" "eks_cluster_and_eks_nodes_role" {
  assume_role_policy = data.aws_iam_policy_document.iam_role_trust_policy.json
  name = "cluster-role"

  tags = {
    tag-key = "dev"
  }

depends_on = [
      aws_s3_bucket.terraform_state
    ]
}


data "aws_iam_policy_document" "iam_role_trust_policy" {
  
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      identifiers = ["ec2.amazonaws.com", "eks.amazonaws.com"]
      type        = "Service"
    }
  }
}

#######################
# Policay attachement #
#######################
resource "aws_iam_role_policy_attachment" "attach_eks_role" {
  role       = aws_iam_role.eks_cluster_and_eks_nodes_role.name
  policy_arn = aws_iam_policy.eks_policy.arn
}

data "aws_iam_policy_document" "eks_iam_policy_doc" {
  statement {
    sid = "CWLogGroupManagement"
    actions = [
                "logs:CreateLogGroup",
                "logs:DescribeLogGroups",
                "logs:PutRetentionPolicy"
            ]
    resources = [
    "arn:aws:logs:*:*:log-group:/eks/",
    "arn:aws:logs:*:*:log-group:/eks/*",
    ]
  }
  statement {
    sid = "CWLogStreamManagement"
    
    actions = [
               "logs:CreateLogStream",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents",
            ]
    resources = [
    "arn:aws:logs:*:*:log-group:/aws/eks/*:log-stream:*",
    "arn:aws:logs:*:*:log-group:/eks/:*"
    ]
  }
  statement {
    sid = "ec2Permissions"
    
    actions = [
            "ec2:*",
            "autoscaling:*",
            "ec2:*",
            "kms:*",
            "elasticloadbalancing:*"
            ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_and_eks_nodes_role.name
}

# Optionally, enable Security Groups for Pods
# Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html
resource "aws_iam_role_policy_attachment" "example-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_cluster_and_eks_nodes_role.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_cluster_and_eks_nodes_role.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_cluster_and_eks_nodes_role.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_cluster_and_eks_nodes_role.name
}
