module "my_instance_module" {
        source = "./my-modules/instance"
        ami = "ami-04169656fea786776"
        instance_type = "t2.nano"
        instance_name = "myvm01"
}    
