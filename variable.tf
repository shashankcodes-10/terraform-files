variable "intance_type" {
    default = "t3.micro"
    type = string
}

variable "volume_size" {
    default = 10
    type = number
}

variable "volume_type" {
    default = "gp3"
    type = string
}

variable "instance_name" {
    default = "first-terraform-instance"
    type = string
}

variable "security_group_name" {
    default = "my_sg"
    type = string
}

variable "key_name" {
    default = "terraform-key"
    type = string
}

variable "instances" {
  type = map(string)

  default = {
    instance1 = "t3.micro"
    instance2 = "t3.micro"
  }
}