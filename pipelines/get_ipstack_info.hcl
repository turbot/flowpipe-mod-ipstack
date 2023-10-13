pipeline "get_ipstack_info" {
  description = "Retrieve information about an IP address."

  param "access_key" {
    type    = string
    default = var.access_key
  }

  param "ip_address" {
    type    = string
    default = var.ip_address
  }

  param "output" {
    type    = string
    default = var.output
  }

  param "security_module" {
    type    = number
    default = var.security_module
  }

  step "http" "get_ipstack_info" {
    method = "post"

    url = "http://api.ipstack.com/${param.ip_address}?access_key=${param.access_key}&output=${param.output}&security=${param.security_module}"

  }

  output "response_body" {
    value = jsondecode(step.http.get_ipstack_info.response_body)
  }
  output "response_headers" {
    value = step.http.get_ipstack_info.response_headers
  }
  output "status_code" {
    value = step.http.get_ipstack_info.status_code
  }
}
