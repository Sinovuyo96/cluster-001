variable "terraform_state_bucket_name" {
    type = string
    description = "Terraform state bucket"
    default = "eks-application-state-bucket"
}

variable "vpc_id" {
    type = string
    description = "Cluster vpc id"
    default = "vpc-09c6113419b39f33b"
}

