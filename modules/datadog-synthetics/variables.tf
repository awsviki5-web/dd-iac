variable "service_name" {
  description = "Name of the service"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "url" {
  description = "URL to test"
  type        = string
}

variable "http_method" {
  description = "HTTP method"
  type        = string
  default     = "GET"
}

variable "expected_status_code" {
  description = "Expected HTTP status code"
  type        = number
  default     = 200
}

variable "response_time_threshold" {
  description = "Maximum acceptable response time in ms"
  type        = number
  default     = 2000
}

variable "locations" {
  description = "List of locations to run the test from"
  type        = list(string)
  default     = ["aws:us-east-1", "aws:eu-west-1"]
}

variable "check_interval" {
  description = "How often to run the test (in seconds)"
  type        = number
  default     = 300 # 5 minutes
}

variable "notification_channel" {
  description = "Notification channel"
  type        = string
}

variable "tags" {
  description = "Additional tags"
  type        = list(string)
  default     = []
}

variable "status" {
  description = "Status of the synthetic test (live or paused)"
  type        = string
  default     = "live"
}

variable "timeout" {
  description = "Request timeout in seconds"
  type        = number
  default     = 30
}

variable "headers" {
  description = "HTTP headers to include in the request"
  type        = map(string)
  default     = {}
}

variable "follow_redirects" {
  description = "Whether to follow redirects"
  type        = bool
  default     = true
}

variable "min_failure_duration" {
  description = "Minimum failure duration before alerting (seconds)"
  type        = number
  default     = 0
}

variable "min_location_failed" {
  description = "Minimum number of locations that must fail"
  type        = number
  default     = 1
}

variable "retry_count" {
  description = "Number of retries on failure"
  type        = number
  default     = 2
}

variable "retry_interval" {
  description = "Interval between retries (ms)"
  type        = number
  default     = 300
}