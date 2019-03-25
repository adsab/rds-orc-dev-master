# RDS instances parameter groups are handled differently, you can set any Dynamic DB Paramether via the client, for a list of
# As a default we provide the MAX_CONN parameter for your reference.
# Remember to always restart the DB instance after changing the Static params.

resource "aws_db_parameter_group" "default" {
  count     	  = "${var.vrds_custom_param_group ? 1 : 0}"
  name            = "hpp-param-master"
  family          = "${var.db_family}"
  description     = "rds instance parameter group"

  parameter {
    name          = "max_connections"
    value         = "${var.param_max_connections}"
    apply_method  = "pending-reboot"
  }

  tags {
    ProductCode   = "${var.product_code_tag}"
    Environment   = "${var.environment_tag}"
    InventoryCode = "${var.inventory_code_tag}"
    Creator       = "${var.resource_creator}"
  }
}

resource "aws_db_parameter_group" "default_ro" {
  count           = "${var.vrds_custom_param_group && var.vrds_ro_count > 0 ? 1 : 0}"
  name            = "hpp-param-ro"
  family          = "${var.db_family}"
  description     = "rds instance parameter group"

  parameter {
    name          = "max_connections"
    value         = "${var.param_ro_max_connections}"

  tags {
    ProductCode   = "${var.product_code_tag}"
    Environment   = "${var.environment_tag}"
    InventoryCode = "${var.inventory_code_tag}"
    Creator       = "${var.resource_creator}"
  }
}
}
