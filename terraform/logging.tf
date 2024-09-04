resource "aws_cloudwatch_log_group" "cluster_logging" {
  name = var.clw-logs

  tags = {
    Environment = "production"
    Application = "eks-cluster"
  }
}

resource "aws_cloudwatch_log_stream" "foo" {
  name           = "eks-cluster"
  log_group_name = aws_cloudwatch_log_group.cluster_logging.name
}
