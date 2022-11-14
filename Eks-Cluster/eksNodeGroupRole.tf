# Role for nodegroup

resource "aws_iam_role" "k8s_node_role" {
    name = "${local.name}-k8s-node"

    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = local.common_tags
  
}

resource "aws_iam_role_policy_attachment" "k8s-AmazonEKSWorkerNodePolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role = aws_iam_role.k8s_node_role.name
  
}

resource "aws_iam_role_policy_attachment" "k8s-AmazonEKS_CNI_Policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role = aws_iam_role.k8s_node_role.name
  
}

resource "aws_iam_role_policy_attachment" "k8s-AmazonEC2ContainerRegistryReadOnly" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.k8s_node_role.name
  
}
