module "eks-cluster-us-east-1" {
  source                      = "../../terraform/"
  terraform_state_bucket_name = "eks-application-state-bucket"
    
  # Networking configs
  vpc_id                      = "vpc-0dd05672a28f8c04f"
  subnet_ids                  = ["subnet-0ad97fe7c78478677", "subnet-0edf8a26532ea55a5"]
    
  # eks cluster settings      
  cluster_name                = "cluster-001"
  node_group_name             = "node-group-001"
  
  # ingress alb service account
#  aws_alb_serv_account_name   = "aws-load-balancer-controller"
#  namespace                   = "kube-system"
#  role_name                   = "AmazonEKSLoadBalancerControllerRole"
#  svc_acc_policy              = "AWSLoadBalancerControllerIAMPolicy"
}

