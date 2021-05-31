# data "aws_ami" "centos" {
#   most_recent = true
#   filter {
#     name   = "name"
#     values = ["CentOS Linux 7 x86_64 HVM EBS ENA 2002_01-b7ee8a69-ee97-4a49-9e68-afaee216db2e-ami-0042af67f8e4dcc20.4"]
#   }
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
#   owners = ["679593333241"] 
# }
resource "aws_instance" "web" {
  ami             = "ami-0d5eff06f840b45e9"
  subnet_id       = module.vpc_team1.public_subnets[0]
  security_groups = [aws_security_group.team4.id]
  instance_type   = "t2.micro"
  user_data       = file("userdata")
  tags = {
    Name = "WordPress"
  }
}