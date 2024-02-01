# valid_string_concat.tftest.hcl

variables {
  registration_domains = {
    domain_name  = "test.com"
    name_servers = ["ns1.example.com", "ns2.example.com"]
  }
}


run "domain_registration" {
  module {
    source = "./examples/default"
  }
}

run "valid_string_concat" {

  command = plan

  assert {
    condition     = aws_route53domains_registered_domain.domain.domain_name == "test.com"
    error_message = "Domain Name did not match the value expected."
  }

  assert {
    condition     = aws_route53domains_registered_domain.domain.name_server == ["ns1.example.com", "ns2.example.com"]
    error_message = "Name Servers did not match the value expected."
  }

}
