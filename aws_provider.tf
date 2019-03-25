provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

provider "aws" {
  alias = "crossregion"
  region  = "${var.aws_cross_region}"
  profile = "${var.aws_profile}"
}
