############################
# s3 Temp bucket
############################

#variable "terraform_state_bucket_name" {
#    type = string
#    description = "Terraform state bucket"
#}

###################
# Cluster Logging
###################
variable "clw-logs" {
    type = string
    description = "cluster logging"
}

####################################
# EKS networking config
####################################
variable "vpc_id" {
    type        = string
    description = "Cluster vpc id"
}

variable "region" {
    type       = string
    description = "Cluster region"
    default     = "us-east-1"
}

variable "subnet_ids" {
    type = list(string)
    description = "Cluster vpc id"
}

#########################
# Cluster settings
#########################
variable "cluster_name" {
    type         = string
    description  = "eks cluster"
}

variable "node_group_name" {
    type         = string
    description  = "eks cluster"
} 

#######################################
# aws alb service account settings
#######################################

# variable "aws_alb_serv_account_name" {
#     type = string
#     default = "aws-load-balancer-controller"
# } 

 #variable "namespace" {
 #    type = string
 #    default = "kube-system"
 #}

# variable "role_name" {
#     type = string
 #    default = "AmazonEKSLoadBalancerControllerRole"
# }
# variable "svc_acc_policy" {
#     type = string
 #    default = "AWSLoadBalancerControllerIAMPolicy"
# }

