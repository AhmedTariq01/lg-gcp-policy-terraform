<<<<<<< HEAD
# provider
provider "google" {
  credentials = file("Credentials/terraformkey1.json")
  # project_id
  project = "lofty-generator-312118"
  region  = "us-central1"


  #   credentials = "./creds/serviceaccount.json"
  # # project_id
  # project = "lofty-generator-312118"
  # # "prj-lg-n-tom-poc"
  # region  = "us-central1"
  # # "europe-west1"

  # project_id
  # prj-lg-n-tom-poc, europe-west1

}

terraform {
  backend "gcs" {
    bucket      = "terraform-state01"
    prefix      = "terraform-state"
    credentials = "Credentials/terraformkey1.json"
  }
=======
# provider
provider "google" {
  credentials = file("Credentials/terraformkey1.json")
  # project_id
  project = "lofty-generator-312118"
  region  = "us-central1"


  #   credentials = "./creds/serviceaccount.json"
  # # project_id
  # project = "lofty-generator-312118"
  # # "prj-lg-n-tom-poc"
  # region  = "us-central1"
  # # "europe-west1"

  # project_id
  # prj-lg-n-tom-poc, europe-west1

}

terraform {
  backend "gcs" {
    bucket      = "terraform-state01"
    prefix      = "terraform-state"
    credentials = "Credentials/terraformkey1.json"
  }
>>>>>>> 0b644181e70c4a816bdc823b7d9ea0cd38037175
}