############################
# s3 Temp bucket
############################

variable "terraform_state_bucket_name" {
#    type = string
    default = "temp-terraform-state-bucket-name-2024"
    description = "Terraform state bucket"
}

####################################
# EKS networking config
####################################
variable "vpc_id" {
    type = string
    description = "Cluster vpc id"
#    default = "vpc-0ddbe56491f34ab1a"
}

variable "subnet_ids" {
    type = list(string)
    description = "Cluster vpc id"
#    default = ["subnet-07cb6040dfb8d76f5", "subnet-0edf310825a857979"]
}

#########################
# Cluster settings
#########################
variable "cluster_name" {
    type = string
#    default = "cluster-001"
}

variable "node_group_name" {
    type = string
#    default = "node-group-001"
} 

#######################################
# aws alb service account settings
#######################################

 variable "aws_alb_serv_account_name" {
     type = string
#     default = "aws-load-balancer-controller"
 } 

 #variable "namespace" {
 #    type = string
 #    default = "kube-system"
 #}

 variable "role_name" {
     type = string
 #    default = "AmazonEKSLoadBalancerControllerRole"
 }
 variable "svc_acc_policy" {
     type = string
 #    default = "AWSLoadBalancerControllerIAMPolicy"
 }

