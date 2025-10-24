terraform {
    backend "remote" {
        hostname = "trialjaswin.jfrog.io"
        organization = "terraform-backend"
        workspaces {
            prefix = "osp-sre-dd-"
        }
    }
}