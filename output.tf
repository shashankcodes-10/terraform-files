# output "aws_instance_id" {
#     value = aws_instance.my_instance.id
# }

# output "aws_instance_ip" {
#    value = aws_instance.my_instance.public_ip
# }


output "aws_instance_id" {
    value = aws_instance.my_instance[*].id
}

output "aws_instance_ip" {
   value = aws_instance.my_instance[*].public_ip
}

# output "aws_instance_id" {
#   value = {
#     for key, instance in aws_instance.my_instance :
#     key => instance.id
#   }
# }

# output "aws_instance_ip" {
#   value = {
#     for key, instance in aws_instance.my_instance :
#     key => instance.public_ip
#   }
# }