module "rds_cluster" {
  source = "Matii84/rds_cluster/aws"


  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.07.2"
  availability_zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  database_name           = "db"
  master_username         = "foo"
  master_password         = "MYPROJECT"
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  region                  = "us-east-1"
  subnet_ids = [module.vpc_team1.public_subnets[0],
    module.vpc_team1.public_subnets[1],
  module.vpc_team1.public_subnets[2]]
}