pipeline "ip_lookup" {
  title       = "IP Address Look up"
  description = "Retrieve information about an IP address."

  param "access_key" {
    type        = string
    description = "The ipstack API token."
    default     = var.access_key
  }

  param "ip_address" {
    type        = string
    description = "The ip addrss to lookup."
  }

  param "output_type" {
    type        = string
    description = "The output type. It supports json and xml."
    default     = "json"
  }

  param "security_module" {
    type        = number
    description = "The required security module. Professional Plus plan is required to access the ipstack API's Security Modul."
    default     = 0
  }

  param "fields" {
    type        = string
    description = "Fields parameter used to limit API results to a certain object or set of objects. Setting the fields object to specific value such as country_code causes the ipstack API to return only the country_code object."
    default     = "main,country_code,location"
  }

  step "http" "ip_lookup" {
    method = "post"
    url    = "http://api.ipstack.com/${param.ip_address}?access_key=${param.access_key}&output=${param.output_type}&security=${param.security_module}&fields=${param.fields}"
  }

  output "response_body" {
    value = step.http.ip_lookup.response_body
  }
}
