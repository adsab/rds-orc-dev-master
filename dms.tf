resource "aws_dms_replication_instance" "dmsHPP" {
  allocated_storage            = "${var.dms_allocated_storage}"
  apply_immediately            = true
  auto_minor_version_upgrade   = true
  availability_zone            = "eu-west-2a"
  engine_version               = "${var.dms_engine_version}"
  multi_az                     = "${var.vrds_multi_az}"
  preferred_maintenance_window =   "${var.vrds_maintenance_window}"
  publicly_accessible          = false
  replication_instance_class   = "${var.dms_replication_instance_class}"
  replication_instance_id      = "dms-replication-instance-tf-${var.resource_creator}"
  replication_subnet_group_id  = "${var.dms_subnet}"
  vpc_security_group_ids       = ["${aws_security_group.sql.id}"]

  tags {
    ProductCode   = "${var.product_code_tag}"
    Environment   = "${var.environment_tag}"
    InventoryCode = "${var.inventory_code_tag}"
    DBIdentifier  = "${var.vrds_identifier}"
    Creator       = "${var.resource_creator}"
}
}
