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
    default = ["subnet-03a226f4f95726e02", "subnet-08ab9437cc511cb37"]
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
