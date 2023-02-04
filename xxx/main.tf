provider "aws" {
	region = var.aws_region
}

module "my_instance_module" {
        source = "./my_modules/instance"
        ami = "ami-04169656fea786776"
        instance_type = "t2.nano"
        instance_name = "myvm01"
}    
