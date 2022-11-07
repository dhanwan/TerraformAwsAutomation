resource "aws_iam_role" "tf_cicd_role" {
      name = "tf_CodePipelineRole"


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    "Name" = "cicd-dev"
  }
  
}

data "aws_iam_policy_document" "tf_iam_policy" {

    statement {
      sid = ""
      actions = [""]
    }
    statement {
      sid = ""
      actions = [ "logs:*","s3:*","codebuild:*", "iam:*" ]
      resources = ["*"]
    }
  
}

resource "aws_iam_policy" "tf_iam_policy" {
    name = "tf_CodePiplineCiCd"
    path = "/"
    description = "Allow s3 codebuild and cloudwatch"
    policy = data.aws_iam_policy_document.tf_iam_policy.json
  
}