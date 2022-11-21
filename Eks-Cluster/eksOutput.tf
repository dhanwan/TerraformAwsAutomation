# Eks cluster

output "cluster_id" {
    description = "Cluster id for eks cluster"
    value = aws_eks_cluster.k8s.id
  
}

output "cluster_arn" {
    description = "eks cluster aws arn"
    value = aws_eks_cluster.k8s.arn
  
}

output "cluster_certificate_authority_data" {

    value = aws_eks_cluster.k8s.certificate_authority[0].data
  
}

output "cluster_endpoint" {
    value = aws_eks_cluster.k8s.endpoint
  
}

output "cluster_version" {
    value = aws_eks_cluster.k8s.version
  
}

# output "cluster_security_group_id" {
#     value = [aws_eks_cluster.k8s.vpc_config[0].cluster_security_group_ids]
  
# }

output "cluster_iam_role_name" {
    value = aws_iam_role.k8s_role.name
  
}

output "cluster_iam_role_arn" {
    value = aws_iam_role.k8s_role.arn
  
}

output "cluster_primary_security_group" {
    value = aws_eks_cluster.k8s.vpc_config[0].cluster_security_group_id
  
}

output "cluster_oidc_issuer_url" {
  description = "The URL on the EKS cluster OIDC Issuer"
  value       = aws_eks_cluster.k8s.identity[0].oidc[0].issuer
}

# NodeGroup public

output "node_group_public_id" {
    value = aws_eks_node_group.k8s-ng-public.id
  
}

output "node_group_public_arn" {
    value = aws_eks_node_group.k8s-ng-public.arn
  
}

output "node_group_public_version" {
    value = aws_eks_node_group.k8s-ng-public.version
  
}

output "node_group_public_status" {
    value = aws_eks_node_group.k8s-ng-public.status
  
}


# Node Group Private
# output "node_group_private_id" {
#     value = aws_eks_node_group.k8s-ng-private.id
  
# }

# output "node_group_private_arn" {
#     value = aws_eks_node_group.k8s-ng-private.arn
  
# }

# output "node_group_private_version" {
#     value = aws_eks_node_group.k8s-ng-private.version
  
# }

# output "node_group_private_status" {
#     value = aws_eks_node_group.k8s-ng-private.status
  
# }