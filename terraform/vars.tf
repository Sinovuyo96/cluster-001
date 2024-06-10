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
    default = "vpc-0adf3e852d182ba30"
}

variable "subnet_ids" {
    type = list(string)
    description = "Cluster vpc id"
    default = ["subnet-0520793f759214bbd", "subnet-082a73a6f9c025b61"]
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
