resource "aws_route53_record" "expense" {
  # count = length(var.instances)
  # count = 3
  for_each = aws_instance.this
  zone_id = var.zone_id
  # name    = "${var.instances[count.index]}.${var.domain_name}"
  name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
  allow_overwrite = true
}