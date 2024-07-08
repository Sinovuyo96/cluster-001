module "eks-cluster-us-east-1" {
  source                      = "../../terraform/"
  terraform_state_bucket_name = "temp-terraform-state-bucket-name-2024"
    
  # Networking configs
  vpc_id                      = "vpc-00030f56014018499"
  subnet_ids                  = ["subnet-095e01e5444585e4e", "subnet-085bd087e28978b7d"]
    
  # eks cluster settings      
  cluster_name                = "cluster-001"
  node_group_name             = "node-group-001"
  
  # ingress alb service account
  aws_alb_serv_account_name   = "aws-load-balancer-controller"
#  namespace                   = "kube-system"
  role_name                   = "AmazonEKSLoadBalancerControllerRole"
  svc_acc_policy              = "AWSLoadBalancerControllerIAMPolicy"
}

#temp/remove after testing
provider "aws" {
  region = "us-east-1"
}
