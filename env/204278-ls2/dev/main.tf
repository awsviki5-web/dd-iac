# Microservice A - Base Monitors
module "service_a_monitors" {
  source = "../../../modules/datadog-base-monitor"

  service_name         = "microservice-a"
  environment          = var.environment
  notification_channel = var.notification_channel

  cpu_threshold_critical    = 85
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

# Microservice A - Synthetic Test
module "service_a_synthetic" {
  source = "../../../modules/datadog-synthetics"

  service_name         = "microservice-a"
  environment          = var.environment
  url                  = "https://dev.product-a.com/api/v1/health"
  notification_channel = var.notification_channel

  expected_status_code      = 200
  response_time_threshold   = 2000
  check_interval            = 300
  locations                 = ["aws:us-east-1", "aws:us-west-2"]

  tags = [
    "product:${var.product}",
    "team:api"
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

# Microservice B - Synthetic Test
module "service_b_synthetic" {
  source = "../../../modules/datadog-synthetics"

  service_name         = "microservice-b"
  environment          = var.environment
  url                  = "https://dev.product-a.com/platform/health"
  notification_channel = var.notification_channel

  tags = [
    "product:${var.product}",
    "team:platform"
  ]
}