resource "aws_s3_bucket" "tfhobby-bucket" {
  bucket = "tfhobby-lambda-bucket"

  tags = {
    Name        = "tfhobby-test-bucket"
    Environment = "test"
  }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.tfhobby-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.example]
  bucket = aws_s3_bucket.tfhobby-bucket.id
  acl    = "private"
}

resource "random_string" "bucket_suffix" {
    length = 4
    special = false
    upper = false
}

resource "aws_s3_object" "tfhobby_lambda_code" {
    bucket = aws_s3_bucket.tfhobby-bucket.bucket
    key = "tfhobby_lambda_code_${random_string.bucket_suffix.result}.zip"
    source = "modules/lambda/zip/tfhobby_lambda.zip"
    etag = "${filemd5("modules/lambda/zip/tfhobby_lambda.zip")}"
    acl = "private"
    tags = {
        Name        = "tfhobby-lambda-code"
        Environment = "test"
    }
}
