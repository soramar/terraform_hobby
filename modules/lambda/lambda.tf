resource "aws_lambda_function" "tfhobby_lambda" {
  function_name = "tfhobby_lambda_rb"
  s3_bucket = module.s3_modules.tfhobby_bucket
  s3_key = module.s3_modules.s3_key
  handler = "lambda_function.lambda_handler"
  runtime = "ruby3.2"
  role = aws_iam_role.tfhobby_lambda_role.arn
  timeout = 60
  memory_size = 128
  environment {
    variables = {
      S3_BUCKET = module.s3_modules.tfhobby_bucket
      S3_KEY = module.s3_modules.s3_key
    }
  }
  tags = {
    Name = "tfhobby_lambda"
    Environment = "test"
  }
  
}
