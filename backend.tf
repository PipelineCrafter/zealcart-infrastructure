terraform {
  backend "s3" {
    bucket       = "zealcart-tf-state"
    key          = "networking/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true

  }
}
