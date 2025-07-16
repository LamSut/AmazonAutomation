module "vpc" {
  source = "./tf-modules/vpc"
}


#####################
### EC2 Instances ###
#####################

module "ec2" {
  source           = "./tf-modules/ec2"
  public_subnet_1  = module.vpc.public_subnet_1
  private_subnet_1 = module.vpc.private_subnet_1
  private_subnet_2 = module.vpc.private_subnet_2
  sg_ssh           = module.vpc.sg_ssh
  sg_rdp           = module.vpc.sg_rdp
  sg_rds_ec2       = module.vpc.sg_rds_ec2
}

output "ec2_public_ips" {
  value = {
    amazon  = module.ec2.amazon_public_ips
    ubuntu  = module.ec2.ubuntu_public_ips
    windows = module.ec2.windows_public_ips
  }
}


###################
### Aurora RDS  ###
###################

# module "rds" {
#   source           = "./tf-modules/rds"
#   vpc              = module.vpc.vpc
#   sg_rds_ec2       = module.vpc.sg_rds_ec2
#   private_subnet_1 = module.vpc.private_subnet_1
#   private_subnet_2 = module.vpc.private_subnet_2
# }

# output "mysql_connect_cmd" {
#   description = "MySQL CLI connection string"
#   value       = "mysql -h ${module.rds.mysql_endpoint} -u limtruong -plimkhietngoingoi limdb"
# }


###################
### S3 Storage  ###
###################

module "s3_static_site" {
  source = "./tf-modules/s3"
}

output "static_website_url" {
  description = "URL to access the static website"
  value       = module.s3_static_site.static_website_url
}
