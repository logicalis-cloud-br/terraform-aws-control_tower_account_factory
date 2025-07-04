{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": "arn:${data_aws_partition_current_partition}:logs:${data_aws_region_current_name}:${data_aws_caller_identity_current_account_id}:log-group:/aws/codebuild/ct-aft*",
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:CreateNetworkInterface",
        "ec2:DescribeDhcpOptions",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DeleteNetworkInterface",
        "ec2:DescribeSubnets",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeVpcs"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:CreateNetworkInterfacePermission"
      ],
      "Resource": [
        "arn:${data_aws_partition_current_partition}:ec2:${data_aws_region_current_name}:${data_aws_caller_identity_current_account_id}:network-interface/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:*Item"
      ],
      "Resource": [
        "arn:${data_aws_partition_current_partition}:dynamodb:${data_aws_region_current_name}:${data_aws_caller_identity_current_account_id}:table/${data_aws_dynamo_account_request_table}"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:List*",
        "s3:PutObjectAcl",
        "s3:PutObject"
      ],
      "Resource": [
        "${aws_s3_bucket_aft_codepipeline_customizations_bucket_arn}",
        "${aws_s3_bucket_aft_codepipeline_customizations_bucket_arn}/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "kms:Decrypt",
        "kms:Encrypt",
        "kms:GenerateDataKey"
      ],
      "Resource": "${data_aws_kms_alias_aft_key_target_key_arn}"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ssm:GetParameters",
        "ssm:GetParameter"
      ],
      "Resource": [
        "arn:${data_aws_partition_current_partition}:ssm:${data_aws_region_current_name}:${data_aws_caller_identity_current_account_id}:parameter/aft/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "codecommit:GetBranch",
        "codecommit:GetRepository",
        "codecommit:GetCommit",
        "codecommit:GitPull",
        "codecommit:UploadArchive",
        "codecommit:GetUploadArchiveStatus",
        "codecommit:CancelUploadArchive"
      ],
      "Resource": "arn:${data_aws_partition_current_partition}:codecommit:${data_aws_region_current_name}:${data_aws_caller_identity_current_account_id}:*account-request*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "sts:AssumeRole"
      ],
      "Resource": [
        "arn:${data_aws_partition_current_partition}:iam::${data_aws_caller_identity_current_account_id}:role/AWSAFTAdmin"
      ]
    },
    {
      "Effect": "Allow",
      "Resource": ["*"],
      "Action": [
        "codeconnections:GetConnectionToken"
      ]
    }
  ]
}
