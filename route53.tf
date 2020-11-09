resource "aws_route53_record" "root" {
    zone_id = var.zone_id
    name    = ""
    type    = "A"

    alias {
        name                    = aws_cloudfront_distribution.root_distribution.domain_name
        zone_id                 = aws_cloudfront_distribution.root_distribution.hosted_zone_id
        evaluate_target_health  = false
    }
}

resource "aws_route53_record" "www" {
    zone_id = var.zone_id
    name    = var.www_domain_name
    type    = "A"

    alias {
        name                    = aws_cloudfront_distribution.root_distribution.domain_name
        zone_id                 = aws_cloudfront_distribution.root_distribution.hosted_zone_id
        evaluate_target_health  = false
    }
}
