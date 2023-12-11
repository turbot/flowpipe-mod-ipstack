pipeline "lookup_ip_address" {
  title       = "Lookup IP Address"
  description = "Retrieve information about an IP address."

  tags = {
    type = "featured"
  }

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "ip_address" {
    type        = string
    description = "The IP address to lookup."
  }

  param "output_type" {
    type        = string
    description = "The output type. It supports json and xml."
    default     = "json"
  }

  param "security_module" {
    type        = number
    description = "The required security module. Professional plus plan is required to access the ipstack API's security module."
    default     = 0
  }

  param "fields" {
    type        = string
    description = "Fields parameter used to limit API results to a certain object or set of objects. Setting the fields object to specific value such as country_code causes the ipstack API to return only the country_code object."
    default     = "main,country_code,location"
  }

  step "http" "lookup_ip_address" {
    method = "post"
    url    = "http://api.ipstack.com/${param.ip_address}?access_key=${credential.ipstack[param.cred].access_key}&output=${param.output_type}&security=${param.security_module}&fields=${param.fields}"
  }

  output "ip_address_details" {
    description = "IP address details."
    value = step.http.lookup_ip_address.response_body
  }
}
