#####################
### EC2 Key Pairs ###
#####################

variable "key_name" {
  type    = string
  default = "b2111933-pair"
}


##################
### Networking ###
##################

variable "public_subnet_1" {}
variable "private_subnet_1" {}
variable "private_subnet_2" {}
variable "sg_ssh" {}
variable "sg_rdp" {}
variable "sg_rds_ec2" {}


################
### EC2 AMIs ###
################

data "aws_ami" "ami_amazon" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "ami_ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "ami_windows" {
  most_recent = true
  owners      = ["801119661308"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


##########################
### EC2 Instance Types ###
##########################

variable "instance_small" {
  type    = string
  default = "t3.small"
}

variable "instance_medium" {
  type    = string
  default = "t3.medium"
}

variable "instance_large" {
  type    = string
  default = "t3.large"
}
