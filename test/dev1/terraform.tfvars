# Profile and Region
account_tag = "adbennis"
aws_profile = ""
aws_region  = "eu-west-2"

# Tags - Please put your product_code_tag, product_name, enviroment_tag, inventory_code_tag and resource_creator
# Any resource that is missing required tags will be TERMINATED as soon as it has been detected

environment_tag    = "WPdev"		# The environment the resource exists in. Analogous to an on-prem cluster: dev1, qa1, kscott1, yournamehere1, etc
inventory_code_tag = "wp-orcsql"	# Product name and class separated by a dash
product_code_tag   = "PRD111"		# A valid product code (PRD #) from PIM
product_name 	   = "HPP_PILOT"		# Product name
resource_creator   = "adbennis"		# Resource creator
zone  		   = ""	# AWS zone


# Instance Parameters
vrds_engine_version                     = "12.1.0.2.v14"            	#
vrds_engine                             = "oracle-ee"
vrds_identifier                         = "hpp"	                # WARNING  - changing this Forces a new resource
vrds_instance_class                     = "db.m4.xlarge"	# Options include db.t2.small, db.t2.medium, db.t2.large, db.r3.large, db.r3.xlarge, db.r3.2xlarge
vrds_storage_type                       = "io1"                 # "io1" or gp2
vrds_allocated_storage                  = "500" 			# Allocated storage in gigabytes
vrds_iops                               = "3000"                   # Must be number - for gp2 set 0 - for io1 set 1000
vrds_final_snapshot_identifier    	= "final"    		# Optional - the name of your final DB snapshot when this DB instance is deleted (prefixed by your instance identifier)
vrds_skip_final_snapshot                = "true"		# Optional - determines whether a final DB snapshot is created before the database is destroyed
vrds_copy_tags_to_snapshot              = "true"		# Optional - on delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified)
vrds_snapshot_identifier                = ""			# Optional - specifies whether or not to create this database from a snapshot
vrds_username                           = "orcadmin"		# Required (unless a snapshot_identifier is provided)
db_password   	                        = "h3ll0there"			# Required (unless a snapshot_identifier is provided). Set using Jana and credtool.
db_family                               = "oracle-ee-12.1"		# Required - the family of the DB parameter group
db_name                                 = ""			# Optional - the name of your database/schema to create during creation
vrds_backup_retention_period            = "7"			# Optional - the days to retain backups for
vrds_multi_az                           = "false"		# Optional - specifies if the RDS instance is multi-AZ
vrds_port                               = "1521"		# Optional - the port on which the DB accepts connections
vrds_storage_encrypted                  = "false"		# Optional - specifies whether the DB instance is encrypted
vrds_apply_immediately                  = "true"		# Optional - specifies whether any database modifications are applied immediately, or during the next maintenance window
vrds_auto_minor_version_upgrade         = "false"		# Optional - specifies whether minor engine upgrades will be applied automatically to the DB instance during the maintenance window
vrds_allow_major_version_upgrade        = "false"		# Optional - specifies whether major engine upgrades are allowed. Changing this parameter does not result in an outage and the change is ly applied as soon as possible
vrds_subnets_dev                        = "rds_private"
vrds_vpc_id                             = "vpc-a0bf3dc8"
vrds_replicate_source_db                = ""                    # Optional - Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates fier of another RDS Database to replicate
vrds_enabled_cloudwatch_logs_exports    = [ "alert","audit","listener","trace" ]         # Optional - Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace
#vrds_perf_insights                      = "true"
#
#DMS specific parameters
dms_allocated_storage                   = "250"
dms_engine_version                      = "3.1.2"
dms_replication_instance_class          = "dms.t2.large"
dms_subnet                              = "dms-test-sub"

# Instance Parameters for Reader
#  - If Reader is not needed, set this value to 0.
#  - Reader does not have to be same size as Master.
vrds_ro_count                           = "0"                   # number of read only instances
vrds_instance_class_ro                  = "db.t2.medium"	# Options include db.t2.small, db.t2.medium, db.t2.large, db.r3.large, db.r3.xlarge, db.r3.2xlarge
vrds_port_ro				= "1521"		# Optional - the port on which the DB accepts connections
vrds_storage_type_ro                    = "gp2"                 # "io1" or gp2
vrds_iops_ro                            = "0"                   # Must be number - for gp2 set 0 - for io1 set 1000
vrds_copy_tags_to_snapshot_ro           = "true"                # Optional - on delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified)
vrds_apply_immediately_ro               = "true"                # Optional - specifies whether any database modifications are applied immediately, or during the next maintenance window
vrds_auto_minor_version_upgrade_ro      = "false"               # Optional - specifies whether minor engine upgrades will be applied automatically to the DB instance during the maintenance window


# Instance Custom Parameter Group
vrds_custom_param_group			= "false"		# Optional - set to true to create custom instance named parameter groups, reboot of instances required to apply paramter groups


# CloudWatch Alarm Thresholds
cw_alarms				= "false"		# Optional - set to true to receive CloudWatch alarms (NOTE - alarm_sns_topic must be set to a valid SNS Topic)
cw_readiops_thresholds          	= "2000000"
cw_readiops_evaluation_period   	= "1"
cw_writeiops_thresholds         	= "1000000"
cw_writeiops_evaluation_period  	= "1"
cw_conn_thresholds              	= "80"			# RDS max_connections limit determined by Instance Class, set to relevant value here based on your choice of instance class
cw_conn_evaluation_period       	= "5"
cw_cpu_thresholds               	= "80"
cw_cpu_evaluation_period        	= "5"

# Enhanced Monitoring Variables
vrds_enhanced_monitoring_interval       = "0"		        # Optional - must specify an interval other than 0 if monitoring_role_arn is set. Values: 0,1,5,10,15,30,60
vrds_monitoring_role_arn                = ""            	# Optional - E.g. arn:aws:iam::486389912938:role/rds-monitoring-role
