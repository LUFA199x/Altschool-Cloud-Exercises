# Load balancer outputs after running terraform apply

# Outputs:
output "elb_target_group_arn" {
  value = aws_lb_target_group.Altschool-target-group.arn
}
  
output "elb_load_balancer_dns_name" {
  value = aws_lb_Altschool-.load_balancer.dns_name
}

output "elastic_load_balancer_zone_id" {
  value = aws_lb.Altschool-load-balancer.zone_id
}