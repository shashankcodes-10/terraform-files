#--------------------key-pair--------------------------
resource "aws_key_pair" "mykey" {
      key_name = "terraform-key"
      public_key = file("terraform-key.pub")
}

#--------------------vpc-------------------------------
resource "aws_default_vpc" "default_vpc" {
  
}

#-------------------security group---------------------
resource "aws_security_group" "my_sg" {
      name = "my-my_sg"
      vpc_id = aws_default_vpc.default_vpc.id
}

#-------------------inbound outbound rule---------------
resource "aws_vpc_security_group_ingress_rule" "ssh" {
      security_group_id = aws_security_group.my_sg.id
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 22
      ip_protocol = "tcp"
      to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "http" {
      security_group_id = aws_security_group.my_sg.id
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 80
      ip_protocol = "tcp"
      to_port     = 80
}

resource "aws_vpc_security_group_egress_rule" "eg-rules" {
      security_group_id = aws_security_group.my_sg.id
      cidr_ipv4   = "0.0.0.0/0"
      ip_protocol = "-1"
}

#---------------------ec2------------------------------
resource "aws_instance" "my_instance" {
    key_name = aws_key_pair.mykey.key_name
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.my_sg.id ]
    ami = data.aws_ami.ubuntu.id
    
    root_block_device {
         volume_size = 10
         volume_type = "gp3"
    }

    tags = {
      Name = "first-terraform-instance"
    }
}