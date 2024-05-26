variable "terraform_state_bucket_name" {
    type = string
    description = "Terraform state bucket"
    default = "eks-application-state-bucket"
}

variable "table_name" {
    type        = string
    description = "dynamodb table used to manage state lock"
    default     = "dynamodb_state_lock"
}
