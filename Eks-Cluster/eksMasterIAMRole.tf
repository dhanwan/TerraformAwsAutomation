# IAM Role for k8s cluster

resource "aws_iam_role" "k8s_role" {
    name = "${local.name}-k8s"

    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  tags = local.common_tags
  
}

resource "aws_iam_role_policy_attachment" "k8s-AmazonEKSClusterPolicy" {

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role = aws_iam_role.k8s_role.name
}

resource "aws_iam_role_policy_attachment" "k8s-AmazonEKSVPCResourceController" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
    role = aws_iam_role.k8s_role.name
  
}