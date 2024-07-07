module "cluster_creation_us-east-1"{
  source                      = "../terraform/modules/dev"
  terraform_state_bucket_name = "temp-terraform-state-bucket-name-2024"
    
  # Networking configs
  vpc_id                      = "vpc-0ddbe56491f34ab1a"
  subnet_ids                  = ["subnet-07cb6040dfb8d76f5", "subnet-0edf310825a857979"]
    
  # eks cluster settings      
  cluster_name                = "cluster-001"
  node_group_name             = "node-group-001"
  
  # ingress alb service account
  aws_alb_serv_account_name   = "aws-load-balancer-controller"
  namespace                   = "kube-system"
  role_name                   = "AmazonEKSLoadBalancerControllerRole"
  svc_acc_policy              = "AWSLoadBalancerControllerIAMPolicy"
}
