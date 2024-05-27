variable "vpc_id" {
    type = string
    description = "Cluster vpc id"
    default = "vpc-04f991d2af1679b4a"
}
variable "subnet_ids" {
    type = list(string)
    description = "Cluster vpc id"
    default = ["subnet-000777ab5c32b809b", "subnet-0594d5597d5e48ac2"]
}
