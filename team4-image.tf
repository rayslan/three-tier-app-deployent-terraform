resource "aws_ami" "wordpress" {
  name                = "wordpress"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"
  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = aws_ebs_snapshot.centos-snapshot.id
    volume_size = 8
  }
}