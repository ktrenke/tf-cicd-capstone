terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }

    backend "s3" {
        bucket = "fj-tf-state"
        key = "<project name>/terraform.state"
        region = "us-west-2"
    }
}

provider "aws" {
    region = "us-west-2"
}

module "codecommit-cicd" {
    source                 = "git::https://github.com/ssccio/terraform-aws-codecommit-cicd.git?ref=master"
    repo_name                 = "new-test-repo"              # Required
    organization_name         = "sscc"                       # Required
    repo_default_branch       = "master"                     # Default value
    aws_region                = "us-west-2"                  # Default value
    char_delimiter            = "-"                          # Default value
    environment               = "dev"                        # Default value
    build_timeout             = "5"                          # Default value
    build_compute_type        = "BUILD_GENERAL1_SMALL"       # Default value
    build_image               = "aws/codebuild/standard:4.0" # Default value
    build_privileged_override = "false"                      # Default value
    test_buildspec            = "buildspec_test.yml"         # Default value
    package_buildspec         = "buildspec.yml"              # Default value
    force_artifact_destroy    = "false"                      # Default value
}
