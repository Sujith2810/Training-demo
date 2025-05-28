resource "aws_lambda_function_url" "local_lambda" {
  function_name      = "arn:aws:lambda:us-east-1:010426082127:function:demo-test"
  authorization_type = "NONE"
}

resource "aws_lambda_function_url" "test_lambda_url" {
  function_name      = "arn:aws:lambda:us-east-1:010426082127:function:demo-test"
  qualifier          = aws_lambda_alias.test_lambda_alias.name
  authorization_type = "AWS_IAM"

  cors {
    allow_credentials = true
    allow_origins     = ["*"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive"]
    expose_headers    = ["keep-alive", "date"]
    max_age           = 86400
  }
}

resource "aws_lambda_permission" "allow_function_url" {
  statement_id             = "AllowFunctionUrlInvoke"
  action                   = "lambda:InvokeFunctionUrl"
  function_name            = "arn:aws:lambda:us-east-1:010426082127:function:demo-test"
  principal                = "*"
  function_url_auth_type   = "NONE"
}


