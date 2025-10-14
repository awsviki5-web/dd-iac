terraform {
    backend "remote" {
        hostname = "trialviki.jfrog.io"
        organization = "terraform-backend"
        workspaces {
            prefix = "osp-sre-dd-"
        }
    }
}