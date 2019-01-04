##

resource "aws_s3_bucket" "ju2" {
    bucket      = "shared-test-data-ju2"
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

resource "aws_s3_bucket" "ju3" {
    bucket      = "shared-test-data-ju3"
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
