terraform {
  backend "artifactory" {
    url      = "https://your-jfrog-instance.jfrog.io/artifactory"
    repo     = "terraform-state"
    subpath  = "datadog/product-a/dev"
  }
}