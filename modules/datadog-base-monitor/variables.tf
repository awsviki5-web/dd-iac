variable "service_name" {
  description = "Name of the microservice"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, qa, prod)"
  type        = string
}

variable "tags" {
  description = "Additional tags for monitors"
  type        = list(string)
  default     = []
}

variable "notification_channel" {
  description = "Datadog notification channel (e.g., slack-alerts, pagerduty)"
  type        = string
}

# CPU Thresholds
variable "cpu_threshold_critical" {
  description = "Critical threshold for CPU usage (%)"
  type        = number
  default     = 90
}

variable "cpu_threshold_warning" {
  description = "Warning threshold for CPU usage (%)"
  type        = number
  default     = 75
}

# Memory Thresholds
variable "memory_threshold_critical" {
  description = "Critical threshold for memory usage (%)"
  type        = number
  default     = 90
}

variable "memory_threshold_warning" {
  description = "Warning threshold for memory usage (%)"
  type        = number
  default     = 75
}

# Error Rate Thresholds
variable "error_rate_threshold_critical" {
  description = "Critical threshold for error rate (%)"
  type        = number
  default     = 5
}

variable "error_rate_threshold_warning" {
  description = "Warning threshold for error rate (%)"
  type        = number
  default     = 2
}

# Latency Thresholds
variable "latency_threshold_critical" {
  description = "Critical threshold for P95 latency (ms)"
  type        = number
  default     = 1000
}

variable "latency_threshold_warning" {
  description = "Warning threshold for P95 latency (ms)"
  type        = number
  default     = 500
}

# Monitor Settings
variable "notify_no_data" {
  description = "Whether to notify when monitor has no data"
  type        = bool
  default     = true
}

variable "no_data_timeframe" {
  description = "Number of minutes before monitor notifies when data is missing"
  type        = number
  default     = 10
}

variable "renotify_interval" {
  description = "Number of minutes after last notification before re-notifying"
  type        = number
  default     = 60
}