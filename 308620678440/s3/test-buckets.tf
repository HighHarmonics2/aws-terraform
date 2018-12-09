##
## bucket for terraform state files

/* - NEED TO FIGURE OUT WHAT TO DO Here
This bucket is managed by terraform.tfstate
when I run this now - this error comes out
Error creating S3 bucket: BucketAlreadyOwnedByYou
THIS is the bucket to store all of the Terrform state files

resource "aws_s3_bucket" "ju-terraform" {
    bucket        = "ju-terraform-state"
    tags {
      Environment = "sbx"
      CreatedBy   = "terraform"
      Purpose     = "tf-state-files"
    }

    acl           = "private"
    versioning {
      enabled     = true
    }

    lifecycle  {
      prevent_destroy     = true
    }
}
*/

resource "aws_s3_bucket" "ju2" {
    bucket      = "shared-test-data-ju2"
    tags {
      Environment = "sbx"
      CreatedBy   = "terraform"
    }
    force_destroy = true
    acl           = "private"
    versioning {
      enabled     = false
    }
}

## bucket for test data
resource "aws_s3_bucket" "ju3" {
    bucket        = "shared-test-data-ju3"
    tags {
      Environment = "sbx"
      CreatedBy   = "terraform"
    }
    force_destroy = true
    acl           = "private"
    versioning {
      enabled     = true
    }
}
