variable "bucket_name" {}
variable "acl" {}
variable "has_policy" {}

data "template_file" "init" {
    template = "${file("${var.bucket_name}.tpl")}"

    vars {
        bucket_name = "${var.bucket_name}"
    }
}

resource "aws_s3_bucket" "b" {
    bucket = "${var.bucket_name}"
    acl = "${var.acl}"
    policy = "${var.has_policy ? data.template_file.init.rendered : ""}"

    
      cors_rule {
        allowed_headers = ["Authorization"]
        allowed_methods = ["GET"]
        allowed_origins = ["*"]
        max_age_seconds = 3000
      }
    
}