pipeline "lookup_requester_ip_address" {
  title       = "Lookup Requester IP Address"
  description = "Retrieve information about the requester IP address."

  param "conn" {
    type        = connection.ipstack
    description = local.conn_param_description
    default     = connection.ipstack.default
  }

  param "output_type" {
    type        = string
    description = "The output type. It supports json and xml."
  }

  param "security_module" {
    type        = number
    description = "The required security module. Professional plus plan is required to access the ipstack API's security module."
  }

  param "fields" {
    type        = string
    description = "Fields parameter used to limit API results to a certain object or set of objects. Setting the fields object to specific value such as country_code causes the ipstack API to return only the country_code object."
  }

  step "http" "lookup_requester_ip_address" {
    method = "post"
    url    = "http://api.ipstack.com/check?access_key=${param.conn.access_key}&output=${param.output_type}&security=${param.security_module}&fields=${param.fields}"
  }

  output "requester_ip_address_details" {
    description = "Requester IP address details."
    value       = step.http.lookup_requester_ip_address.response_body
  }
}
