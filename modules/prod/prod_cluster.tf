module "eks-cluster-us-east-1" {
  source                      = "../../terraform/"
  terraform_state_bucket_name = "eks-application-state-bucket"
    
  # Networking configs
  vpc_id                      = "vpc-021b1da1288bafdd0"
  subnet_ids                  = ["subnet-0b28c4f18c84b31b7", "subnet-08bdb8121bef56500"]
    
  # eks cluster settings      
  cluster_name                = "prod-cluster-002"
  node_group_name             = "prod-node-group-002"
  
  # ingress alb service account
#  aws_alb_serv_account_name   = "aws-load-balancer-controller"
#  namespace                   = "kube-system"
#  role_name                   = "AmazonEKSLoadBalancerControllerRole"
#  svc_acc_policy              = "AWSLoadBalancerControllerIAMPolicy"
}
