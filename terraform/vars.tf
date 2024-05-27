variable "vpc_id" {
    type = string
    description = "Cluster vpc id"
    default = "vpc-0dc821471afbecd3b"
}
variable "subnet_ids" {
    type = list(string)
    description = "Cluster vpc id"
    default = ["subnet-045ca9fc7f1dfe6f7", "subnet-0776b475ba50f5ef3"]
}
