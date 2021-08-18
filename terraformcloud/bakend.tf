terraform {
  backend "remote" {
    organization = "jmsth29"

    workspaces {
      name = "dev"
    }
  }
}
