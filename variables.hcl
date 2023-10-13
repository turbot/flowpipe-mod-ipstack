variable "access_key" {
  type        = string
  description = "The ipstack personal access token to authenticate to the ipstack APIs. Sign up on the https://ipstack.com/ to get your free token. It looks like e0067f483763d6132d549234f8a6de22."
  default     = ""
}

variable "ip_address" {
  type        = string
  description = "A comma-separated list of IPv4 or IPv6 addresses; you can also enter a domain URLs to have ipstack resolve the domains to their underlying IP addresses. (Maxmium allowed values: 50)"
  default     = ""
}

variable "output" {
  type        = string
  description = "ipstack API's output parameter the API result format can be switched between JSON (default) and XML."
  default     = ""
}

variable "security_module" {
  type        = number
  description = "Security Module used to assess risks and threats originating from certain IP addresses before any harm can be done to a website or web application."
  default     = 0
}
