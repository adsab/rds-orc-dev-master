

# resource "aws_route53_record" "default" {
#  zone_id = "${var."
#  name    = "pgsql.${var.environment_tag}.${var.product_name}.${var.zone}"
#  type    = "CNAME"
#  ttl     = "15"
#  records = ["${aws_db_instance.default.address}"]
#}
