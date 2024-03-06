resource "aws_s3_bucket" "name"{
  bucket = "tejapamidi-bucket"
# created a AWS S3 bucket with name tejapamidi_bucket
}

resource "aws_glacier_vault" "my_archive" {
  name = "tejapamidi-glacier" 
#   created a S3 glacier valut for back up
}
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "tejapamidi001"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
# created a AWS RDS with mysql

}
resource "aws_dynamodb_table" "teja-dynamodb-table" {
  name           = "tejaScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
# created a no sql database i.e AWS DynamoDB

}
# this is a sample project of storage services