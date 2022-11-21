resource "aws_eks_cluster" "k8s" {
  name     = local.eks_name
  role_arn = aws_iam_role.k8s_role.arn
  version = var.eks_version

  vpc_config {
    subnet_ids = module.vpc_dev.public_subnets
    endpoint_private_access = var.cluster_enpoint_private_access
    endpoint_public_access = var.cluster_enpoint_public_access
    public_access_cidrs = var.public_access_cidrs
  }

  kubernetes_network_config {
    service_ipv4_cidr = var.cluster_service_ipv4_cidr
  }

  enabled_cluster_log_types = ["api","audit", "authenticator", "controllerManager", "scheduler"]

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.k8s-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.k8s-AmazonEKSVPCResourceController,
  ]
  
}