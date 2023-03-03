variable "subnet_id" {
  type        = string
  description = "ID of the subnet the resource will be created in."
  default     = ""
}

variable "environment" {
  type        = string
  description = "One of the following values: dev/qa/prod"
  default     = ""
}
