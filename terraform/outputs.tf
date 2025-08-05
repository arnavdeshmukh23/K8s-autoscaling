output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]
}

output "cluster_name" {
  value = aws_eks_cluster.k8s_cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.k8s_cluster.endpoint
}

output "node_group_name" {
  value = aws_eks_node_group.node_group.node_group_name
}