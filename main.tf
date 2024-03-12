provider "aws" {
    region = "ap-northeast-1"
    profile = "my_profile"
}

module "network_modules" {
    source = "./modules/network/"
}

module "s3_modules" {
    source = "./modules/s3/"
}

module "lambda_modules" {
    source = "./modules/lambda/"
}
