terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.0"
    }
  }
}

resource "datadog_synthetics_test" "api_test" {
  type    = "api"
  subtype = "http"
  status  = var.status

  name    = "[${var.environment}] ${var.service_name} - API Health Check"
  message = <<-EOT
    Synthetic test failed for ${var.service_name} in ${var.environment}.
    
    @${var.notification_channel}
  EOT

  locations = var.locations

  request_definition {
    method = var.http_method
    url    = var.url
    timeout = var.timeout

    dynamic "headers" {
      for_each = var.headers
      content {
        key   = headers.key
        value = headers.value
      }
    }
  }

  assertion {
    type     = "statusCode"
    operator = "is"
    target   = var.expected_status_code
  }

  assertion {
    type     = "responseTime"
    operator = "lessThan"
    target   = var.response_time_threshold
  }

  options_list {
    tick_every         = var.check_interval
    follow_redirects   = var.follow_redirects
    min_failure_duration = var.min_failure_duration
    min_location_failed  = var.min_location_failed
    retry {
      count    = var.retry_count
      interval = var.retry_interval
    }
  }

  tags = concat(
    var.tags,
    [
      "service:${var.service_name}",
      "env:${var.environment}",
      "synthetic:api",
      "managed_by:terraform"
    ]
  )
}