output "proxy_public_ip" {
  value = aws_instance.proxy.public_ip
}
output "frontend_0_public_ip" {
  value = aws_instance.frontend[0].public_ip
}
output "frontend_1_public_ip" {
  value = aws_instance.frontend[1].public_ip
}
output "database_public_ip" {
  value = aws_instance.database.public_ip
}
output "grafana_public_ip" {
  value = aws_instance.grafana.public_ip
}