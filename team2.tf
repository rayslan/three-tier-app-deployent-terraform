module "ASG-with-ALB" {
  source       = "osmdilya/asg-alb/aws"
  region       = "us-east-1"
  vpc_id       = module.vpc_team1.vpc
  subnet1      = module.vpc_team1.public_subnets[0]
  subnet2      = module.vpc_team1.public_subnets[1]
  key_name     = "jump_box"
  key_location = "~/.ssh/id_rsa.pub"

  # Launch template parameters
  image_id      = aws_ami.wordpress.id
  instance_type = "t2.micro"

  # Autoscaling parameters
  desired_capacity                         = 2
  max_size                                 = 2
  min_size                                 = 2
  health_check_grace_period                = 300
  mixed_instance1                          = "t2.micro"
  mixed_instance2                          = "t2.medium"
  on_demand_base_capacity                  = 0
  on_demand_percentage_above_base_capacity = 25
  spot_price                               = "0.03"

  # Load Balancer parameters
  lb_port             = "80"
  lb_protocol         = "HTTP"
  healthy_threshold   = 3
  unhealthy_threshold = 3
  timeout             = 3
  interval            = 30


  # Security group ingress from/to ports
  sec_group_ingress_from_port = "80"
  sec_group_ingress_to_port   = "80"


  # WAF Classic parameters (specify CIDR block, for countries -specify 2-letter country code)
  blacklisted_ip_set1  = "192.0.7.0/24"
  blacklisted_ip_set2  = "192.168.0.0/24"
  blacklisted_country1 = "CN"
  blacklisted_country2 = "IR"

  tags = {
    Name = "ASG-with-ALB"

  }
}