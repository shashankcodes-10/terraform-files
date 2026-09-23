output "aws_instance_id" {
    value = aws_instance.my_instance.id
}

output "aws_instance_ip" {
   value = aws_instance.my_instance.public_ip
}