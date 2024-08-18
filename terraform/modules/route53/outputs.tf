output "zone_id" {
  description = "The ID of the Route 53 hosted zone."
  value       = aws_route53_zone.this.zone_id
}

output "zone_name" {
  description = "The name of the Route 53 hosted zone."
  value       = aws_route53_zone.this.name
}
