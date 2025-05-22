# accessing vpc module to root 

module "vpc" {
  source               = "C:\\Users\\yogis\\Music\\terraform\\Aws_Timedoctor_infra\\modules\\vpc"
  project              = var.project
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
}

# accessing module s3 bucket to root 

module "s3" {
  source        = "C:\\Users\\yogis\\Music\\terraform\\Aws_Timedoctor_infra\\modules\\s3"
  project       = var.project
  bucket_suffix = "screenshots"

}

#  iam role for ec2 to access s3 + cloudwatch

module "iam" {
  source         = "C:\\Users\\yogis\\Music\\terraform\\Aws_Timedoctor_infra\\modules\\iam"
  project        = var.project
  s3_bucket_name = module.s3.s3_bucket_name
}

# accessing the ec2 instances module

module "ec2" {
  source         = "C:\\Users\\yogis\\Music\\terraform\\Aws_Timedoctor_infra\\modules\\ec2"
  project        = var.project
  vpc_id         = module.vpc.vpc_id
  subnet_id      = module.vpc.public_subnet_ids[0]
  instance_type  = module.ec2.instance_type
  instance_count = 2
  key_name       = var.ec2.key_name
  ami_id         = var.ec2_ami_id
  app_port       = 3000
  # instance_id = module.ec2.instance_id



}

#  accessing the module RDS

module "rds" {
  source         = "C:\\Users\\yogis\\Music\\terraform\\Aws_Timedoctor_infra\\modules\\rds"
  project        = var.project
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.private_subnet_ids
  engine         = "postgress"
  engine_version = "14.1"
  instance_class = var.rds_instance_class
  username       = var.rds_username
  password       = var.rds_password

}

#  accessing the module dynamodb

module "dynamodb" {
  source         = "C:\\Users\\yogis\\Music\\terraform\\Aws_Timedoctor_infra\\modules\\dynamodb"
  project        = var.project
  table_name     = module.dynamodb.table_name
  hash_key       = "user_id"
  range_key      = "timestamp"
  hash_key_type  = "S"
  range_key_type = "S"

}

#  accessing the module cognito

module "cognito" {
  source  = "C:\\Users\\yogis\\Music\\terraform\\Aws_Timedoctor_infra\\modules\\cognito"
  project = var.project

}

#  accessing the module cloudwatch

module "cloudwatch" {
  source            = "C:\\Users\\yogis\\Music\\terraform\\Aws_Timedoctor_infra\\modules\\cloudwatch"
  project           = var.project
  instance_id       = module.ec2.instance_ids[0]
  retention_days    = 7
  cpu_threshold     = 75
  alarm_action_arns = var.cloudwatch_alarm_arns
}