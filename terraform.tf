terraform {
       required_providers{
                aws ={
                    source = "hashicorp/aws"
                    version = "6.65.0"
                }
       }

      backend "s3" {
         bucket = "terraform-secure-state-management"
         dynamodb_table = "db_table"
         key = "terraform.tfstate"
         region = "us-west-2"
      }
}