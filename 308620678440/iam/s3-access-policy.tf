/* s3 policies file
THIS IS A TEST drive - it can be deleted
use aws_iam_role_policy  - this creates an inline policy
*/

#### create policy
resource "aws_iam_role_policy" "s3-policy-shared" {
  name        = "s3-shared"
  role        = "s3-shared-test2"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "0",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": [
                "arn:aws:s3:::shared-test-data-ju",
                "arn:aws:s3:::shared-test-data-ju2"
            ]
        },
        {
            "Sid": "1",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
	              "s3:GetObjectAcl",
                "s3:PutObjectAcl",
		            "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::shared-test-data-ju/*",
                "arn:aws:s3:::shared-test-data-ju2/*",
                "arn:aws:s3:::shared-test-data-ju3/*"
            ]
        }
    ]
}
EOF
}
