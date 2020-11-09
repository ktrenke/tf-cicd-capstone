resource "aws_s3_bucket" "www" {
    bucket = var.www_domain_name
    acl = "public-read"
    policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.www_domain_name}/*"]
    }
  ]
}
POLICY
    
    website {
        redirect_all_requests_to = "https://${var.www_domain_name}"
    }
}

resource "aws_s3_bucket" "root" {
    bucket = var.root_domain_name
    acl = "public-read"
    policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.root_domain_name}/*"]
    }
  ]
}
POLICY
    
    website {
        index_document = "index.html"
        error_document = "404.html"
    }
}

