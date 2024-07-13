module "eks-cluster-us-east-1" {
  source                      = "../../terraform/"
  terraform_state_bucket_name = "eks-application-state-bucket"
    
  # Networking configs
  vpc_id                      = "vpc-0db03313fa3766847"
  subnet_ids                  = ["subnet-033b989ab113aa8ab", "subnet-0cb27acda078c0886"]
    
  # eks cluster settings      
  cluster_name                = "cluster-001"
  node_group_name             = "node-group-001"
  
  # ingress alb service account
#  aws_alb_serv_account_name   = "aws-load-balancer-controller"
#  namespace                   = "kube-system"
#  role_name                   = "AmazonEKSLoadBalancerControllerRole"
#  svc_acc_policy              = "AWSLoadBalancerControllerIAMPolicy"
}

#temp/remove after testing
provider "aws" {
  region = "us-east-1"
}
