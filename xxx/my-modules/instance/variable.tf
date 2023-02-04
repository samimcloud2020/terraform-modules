variable "ami" {
  type          = string
  default       = "ami-04169656fea786776"
}

variable "instance_type" {
  type          = string
  default       = "t2-micro"
}

variable "instance_name" {
  description   = "Value of the Name tag for the EC2 instance"
  type          = string
  default       = "Terraform-Instance"
}

variable "key_name" {
  type          = string
  default       = "samim"
}
