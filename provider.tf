terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.57.0"
    }
  }
}

provider "google" {
  project     = "montreal-project-mcit"
}


terraform {
  cloud {
    organization = "dcoronado-mcit"

    workspaces {
      name = " terraform-gcp-cloud-sql"
    }
  }
}

