resource "aws_ebs_volume" "centos" {
  availability_zone = "us-east-1a"
  size              = 8
  tags = {
    Name = "WordPress-installed"
  }
}
resource "aws_ebs_snapshot" "centos-snapshot" {
  volume_id = aws_ebs_volume.centos.id
  tags = {
    Name = "team4-snap"
  }
}