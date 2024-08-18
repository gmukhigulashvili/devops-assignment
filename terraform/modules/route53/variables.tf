variable "region" {
  description = "The AWS region to deploy the resources."
  type        = string
}

variable "zone_name" {
  description = "The name of the Route 53 hosted zone."
  type        = string
}

variable "comment" {
  description = "A comment for the hosted zone."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to apply to the resources."
  type        = map(string)
  default     = {}
}
