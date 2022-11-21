# resource "aws_eks_node_group" "k8s-ng-private" {
#   cluster_name    = aws_eks_cluster.k8s.name
#   node_group_name = "${local.eks_name}-ng-private"
#   node_role_arn   = aws_iam_role.k8s_node_role.arn
#   subnet_ids      = module.vpc_dev.private_subnets
#   version = var.eks_version
#   ami_type = "AL2_x86_64"
#   capacity_type = "ON_DEMAND"
#   disk_size = 20
#   instance_types = [ "t3.medium" ]

#   remote_access {
#     ec2_ssh_key = var.aws_key
#   }
#   scaling_config {
#     desired_size = 1
#     max_size     = 2
#     min_size     = 1
#   }

#   update_config {
#     max_unavailable = 1
#   }

#   # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
#   # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
#   depends_on = [
#     aws_iam_role_policy_attachment.k8s-AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.k8s-AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.k8s-AmazonEC2ContainerRegistryReadOnly,
#   ]

#   tags = {
#     "Name" = "Private-Node-Group"
#   }
# }