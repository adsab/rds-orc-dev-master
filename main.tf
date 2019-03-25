
resource "aws_db_instance" "default" {
  allocated_storage              = "${var.vrds_allocated_storage}"
  engine                         = "${var.vrds_engine}"
  engine_version                 = "${var.vrds_engine_version}"
  identifier                     = "${var.vrds_identifier}"
  instance_class                 = "${var.vrds_instance_class}"
  storage_type                   = "${var.vrds_storage_type}"
  final_snapshot_identifier      = "${var.vrds_final_snapshot_identifier}"
  skip_final_snapshot            = "${var.vrds_skip_final_snapshot}"
  copy_tags_to_snapshot          = "${var.vrds_copy_tags_to_snapshot}"
  password                       = "${var.db_password}"
  username                       = "${var.vrds_username}"
  backup_retention_period        = "${var.vrds_backup_retention_period}"
  backup_window                  = "${var.vrds_backup_window}"
  iops                           = "${var.vrds_iops}"
  maintenance_window             = "${var.vrds_maintenance_window}"
  multi_az                       = "${var.vrds_multi_az}"
  port                           = "${var.vrds_port}"
  vpc_security_group_ids         = ["${aws_security_group.sql.id}"]
  db_subnet_group_name           = "${var.vrds_subnets_dev}"
  storage_encrypted              = "${var.vrds_storage_encrypted}"
  apply_immediately              = "${var.vrds_apply_immediately}"
  replicate_source_db            = "${var.vrds_replicate_source_db}"
  snapshot_identifier            = "${var.vrds_snapshot_identifier}"
  auto_minor_version_upgrade     = "${var.vrds_auto_minor_version_upgrade}"
  allow_major_version_upgrade    = "${var.vrds_allow_major_version_upgrade}"
  monitoring_interval            = "${var.vrds_enhanced_monitoring_interval}"
  monitoring_role_arn            = "${var.vrds_monitoring_role_arn}"
  enabled_cloudwatch_logs_exports = ["${var.vrds_enabled_cloudwatch_logs_exports}"]
  #performance_insights_enabled   = "${var.vrds_perf_insights}"
 

  tags {
    ProductCode   = "${var.product_code_tag}"
    Environment   = "${var.environment_tag}"
    InventoryCode = "${var.inventory_code_tag}"
    DBIdentifier  = "${var.vrds_identifier}"
    Creator       = "${var.resource_creator}"
  }

  lifecycle {
    prevent_destroy = false
  }
}

# Create read replica in same region
# Since it is a read replica, master user, master user password, storage size and maintenace windows setting will be inherited from master.
# Auto backup feature is available on master only, but it allows customer to do manual snapshot on read replica

resource "aws_db_instance" "default_readonly" {
  count                          = "${var.vrds_ro_count}"
  identifier                     = "${var.vrds_identifier}ro${count.index + 1}"
  vpc_security_group_ids         = ["${aws_security_group.sql.id}"]
  port                           = "${var.vrds_port_ro}"
  storage_type                   = "${var.vrds_storage_type_ro}"
  iops                           = "${var.vrds_iops_ro}"
  instance_class                 = "${var.vrds_instance_class_ro}"
  copy_tags_to_snapshot          = "${var.vrds_copy_tags_to_snapshot_ro}"
  apply_immediately              = "${var.vrds_apply_immediately_ro}"
  auto_minor_version_upgrade     = "${var.vrds_auto_minor_version_upgrade_ro}"
  monitoring_interval            = "${var.vrds_enhanced_monitoring_interval}"
  monitoring_role_arn            = "${var.vrds_monitoring_role_arn}"
  replicate_source_db            = "${aws_db_instance.default.id}"

  tags {
    ProductCode   = "${var.product_code_tag}"
    Environment   = "${var.environment_tag}"
    InventoryCode = "${var.inventory_code_tag}"
    DBIdentifier  = "${var.vrds_identifier}"
    Creator       = "${var.resource_creator}"
  }

}

