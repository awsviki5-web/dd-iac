# Microservice A - Base Monitors
module "service_a_monitors" {
  source = "../../../modules/datadog-base-monitor"

  service_name         = "microservice-a"
  environment          = var.environment
  notification_channel = var.notification_channel

  cpu_threshold_critical    = 80
  cpu_threshold_warning     = 70
  memory_threshold_critical = 85
  memory_threshold_warning  = 70
  error_rate_threshold_critical = 5
  error_rate_threshold_warning  = 2
  latency_threshold_critical    = 1000
  latency_threshold_warning     = 500

  tags = [
    "product:${var.product}",
    "team:api",
    "criticality:high"
  ]
}

# Microservice B - Base Monitors
module "service_b_monitors" {
  source = "../../../modules/datadog-base-monitor"

  service_name         = "microservice-b"
  environment          = var.environment
  notification_channel = var.notification_channel

  cpu_threshold_critical    = 90
  memory_threshold_critical = 90

  tags = [
    "product:${var.product}",
    "team:platform",
    "criticality:medium"
  ]
}