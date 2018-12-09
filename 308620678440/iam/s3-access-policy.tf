/* s3 policies file
*/

resource "aws_iam_policy" "s3-policy-3" {
  name        = "s3-shared-test3"
  path        = "/"
  description = "Policy for access to s3 shared-test-data-ju with no console read, list only on ju2 and jure-content"

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
                "arn:aws:s3:::shared-test-data-ju2",
		            "arn:aws:s3:::jure-content"
            ]
        },
        {
            "Sid": "1",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
		            "s3:GetObjectAcl",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::shared-test-data-ju/1/*",
                "arn:aws:s3:::shared-test-data-ju/2/*"
            ]
        }
    ]
}
EOF
}
