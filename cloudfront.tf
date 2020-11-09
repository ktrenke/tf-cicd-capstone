resource "aws_cloudfront_distribution" "root_distribution" {
    // origin is where CloudFront gets its content from
    origin {
        custom_origin_config {
            http_port = "80"
            https_port = "443"
            origin_protocol_policy = "http-only"
            origin_ssl_protocols = ["TLSv1", "TLSv1.1", "TLSv1.2"]
        }

        domain_name = aws_s3_bucket.root.website_endpoint
        origin_id = var.root_domain_name
    }

    enabled = true
    default_root_object = "index.html"
    
    default_cache_behavior {
        viewer_protocol_policy = "redirect-to-https"
        compress               = true
        allowed_methods        = ["GET", "HEAD"]
        cached_methods         = ["GET", "HEAD"]
    // This needs to match the `origin_id` above.
        target_origin_id       = var.root_domain_name
        min_ttl                = 0
        default_ttl            = 86400
        max_ttl                = 31536000

        forwarded_values {
            query_string = false
            cookies {
                forward = "none"
            }
        }
    }

    aliases = [var.www_domain_name]

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    viewer_certificate {
        acm_certificate_arn = var.acm_arn
        ssl_support_method = "sni-only"
    }
}

output "cloudfront-id" {
  value = "Cloudfront ID: ${aws_cloudfront_distribution.root_distribution.id}"
}
