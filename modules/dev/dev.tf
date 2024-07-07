module "eks-cluster-us-east-1" {
  source                      = "../terraform/"
  terraform_state_bucket_name = "temp-terraform-state-bucket-name-2024"
    
  # Networking configs
  vpc_id                      = "vpc-04d508730bd2b0d34"
  subnet_ids                  = ["subnet-0be6510a6455338bc", "subnet-04b845655f3ebeba0"]
    
  # eks cluster settings      
  cluster_name                = "cluster-001"
  node_group_name             = "node-group-001"
  
  # ingress alb service account
  aws_alb_serv_account_name   = "aws-load-balancer-controller"
  namespace                   = "kube-system"
  role_name                   = "AmazonEKSLoadBalancerControllerRole"
  svc_acc_policy              = "AWSLoadBalancerControllerIAMPolicy"
}

#temp/remove after testing
provider "aws" {
  region = "us-east-1"
}
