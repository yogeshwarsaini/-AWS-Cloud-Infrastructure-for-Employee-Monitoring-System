variable "project" {
  default = "timedoctor"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"

}

variable "public_subnet_cidr" {
  # type = list
  default = ["10.0.1.0/24", "10.0.2.0/24"]

}

variable "private_subnet_cidrs" {
  # type = list
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
  default = ["us-east-2a", "us-east-2b"]

}

variable "ec2_instance_type" {
  default = "t2.micro"

}

variable "ec2_ami_id" {
  description = "Ubuntu AMI or custom"
  default     = "ami-0c55b159cbfafe1f0" # example AMI
}

variable "ec2_key_name" {
  description = "Your EC2 Key pair name"
  default     = "timedoctor-key"
}

variable "rds_instance_class" {
  default = "db.t3.micro"
}

variable "rds_username" {
  default = "shyam"
}

variable "rds_password" {
  default = "Kingfisher123@" # 🔐 Use tfvars or secrets manager in real setup
}

variable "cloudwatch_alarm_arns" {
  type    = list(string)
  default = ["arn:aws:sns:us-east-1:123456789012:NotifyMe"]
}