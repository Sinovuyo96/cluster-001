############################
# s3 Temp bucket
############################

variable "terraform_state_bucket_name" {
    type = string
    default = "temp-terraform-state-bucket-name-2024"
    description = "Terraform state bucket"
}

####################################
# EKS networking config
####################################
variable "vpc_id" {
    type = string
    description = "Cluster vpc id"
    default = "vpc-012bbe32f22368535"
}

variable "subnet_ids" {
    type = list(string)
    description = "Cluster vpc id"
    default = ["subnet-09ae78da6e6f8f061", "subnet-07ff33341602e2b83"]
}

#########################
# Cluster settings
#########################
variable "cluster_name" {
    type = string
    default = "cluster-001"
}

variable "node_group_name" {
    type = string
    default = "node-group-001"
} 

#######################################
# aws alb service account settings
#######################################

# variable "aws_alb_serv_account_name" {
#     type = string
#     default = "aws-load-balancer-controller"
# } 

# variable "namespace" {
#     type = string
#     default = "kube-system"
# }

# variable "role_name" {
#     type = string
#     default = "AmazonEKSLoadBalancerControllerRole"
# }
