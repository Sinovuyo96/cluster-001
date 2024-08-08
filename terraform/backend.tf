
##################
# tf state file  #
##################

terraform {
  backend "s3" {
    bucket         = "eks-application-state-bucket"
    key            = "eks/cluster-001/terraform.tfstate"
    dynamodb_table = "terraform-aws-state-lock"
    region         = "us-east-1"
  }
}
