resource "aws_lambda_alias" "test_lambda_alias" {
  name             = "test_lambda_alias"
  description      = "a sample description"
  function_name    = "arn:aws:lambda:us-east-1:010426082127:function:demo-test"
  function_version = "$LATEST"
}
