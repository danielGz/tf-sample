variable "ssh_private_key" {
  description = "Base64-encoded SSH private key (optional)"
  type        = string
  default     = ""  # Default to an empty string if no key is provided
}
