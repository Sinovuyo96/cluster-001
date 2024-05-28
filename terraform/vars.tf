####################################
# EKS networking config
####################################
variable "vpc_id" {
    type = string
    description = "Cluster vpc id"
    default = "	vpc-099bf61dcb2e90e0e"
}

variable "subnet_ids" {
    type = list(string)
    description = "Cluster vpc id"
    default = ["subnet-05135e5929e9135e3", "subnet-0853a15f31d55f736"]
}

#########################
# Cluster settings
#########################
variable "cluster_name" {
    type = string
    default = "cluster-001"
}
