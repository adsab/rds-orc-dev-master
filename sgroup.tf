resource "aws_security_group" "sql" {
  name = "hpp-secgroup-${var.resource_creator}sql"
  description = "rds instance (terraform-managed)"
  vpc_id      = "${var.vrds_vpc_id}"
  tags {
    ProductCode   = "${var.product_code_tag}"
    Environment   = "${var.environment_tag}"
    InventoryCode = "${var.inventory_code_tag}"
    Creator       = "${var.resource_creator}"
  }
}

resource "aws_security_group_rule" "admin" {
  security_group_id = "${aws_security_group.sql.id}"
  type              = "ingress"
  from_port         = "${var.vrds_port}"
  to_port           = "${var.vrds_port}"
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/16"] 
}
