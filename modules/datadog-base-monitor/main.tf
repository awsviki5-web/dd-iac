terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.0"
    }
  }
}

# CPU Monitor
resource "datadog_monitor" "cpu" {
  name    = "[${var.environment}] ${var.service_name} - High CPU Usage"
  type    = "metric alert"
  message = <<-EOT
    CPU usage is above threshold for ${var.service_name} in ${var.environment}.
    
    @${var.notification_channel}
  EOT

  query = "avg(last_5m):avg:system.cpu.user{service:${var.service_name},env:${var.environment}} > ${var.cpu_threshold_critical}"

  monitor_thresholds {
    critical = var.cpu_threshold_critical
    warning  = var.cpu_threshold_warning
  }

  notify_no_data    = var.notify_no_data
  no_data_timeframe = var.no_data_timeframe
  renotify_interval = var.renotify_interval

  tags = concat(
    var.tags,
    [
      "service:${var.service_name}",
      "env:${var.environment}",
      "monitor_type:cpu",
      "managed_by:terraform"
    ]
  )
}

# Memory Monitor
resource "datadog_monitor" "memory" {
  name    = "[${var.environment}] ${var.service_name} - High Memory Usage"
  type    = "metric alert"
  message = <<-EOT
    Memory usage is above threshold for ${var.service_name} in ${var.environment}.
    
    @${var.notification_channel}
  EOT

  query = "avg(last_5m):avg:system.mem.used{service:${var.service_name},env:${var.environment}} / avg:system.mem.total{service:${var.service_name},env:${var.environment}} * 100 > ${var.memory_threshold_critical}"

  monitor_thresholds {
    critical = var.memory_threshold_critical
    warning  = var.memory_threshold_warning
  }

  notify_no_data    = var.notify_no_data
  no_data_timeframe = var.no_data_timeframe
  renotify_interval = var.renotify_interval

  tags = concat(
    var.tags,
    [
      "service:${var.service_name}",
      "env:${var.environment}",
      "monitor_type:memory",
      "managed_by:terraform"
    ]
  )
}

# Error Rate Monitor
resource "datadog_monitor" "error_rate" {
  name    = "[${var.environment}] ${var.service_name} - High Error Rate"
  type    = "metric alert"
  message = <<-EOT
    Error rate is above threshold for ${var.service_name} in ${var.environment}.
    
    @${var.notification_channel}
  EOT

  query = "sum(last_5m):sum:trace.http.request.errors{service:${var.service_name},env:${var.environment}}.as_count() / sum:trace.http.request.hits{service:${var.service_name},env:${var.environment}}.as_count() * 100 > ${var.error_rate_threshold_critical}"

  monitor_thresholds {
    critical = var.error_rate_threshold_critical
    warning  = var.error_rate_threshold_warning
  }

  notify_no_data    = false
  renotify_interval = var.renotify_interval

  tags = concat(
    var.tags,
    [
      "service:${var.service_name}",
      "env:${var.environment}",
      "monitor_type:error_rate",
      "managed_by:terraform"
    ]
  )
}

# Latency Monitor
resource "datadog_monitor" "latency" {
  name    = "[${var.environment}] ${var.service_name} - High Latency"
  type    = "metric alert"
  message = <<-EOT
    P95 latency is above threshold for ${var.service_name} in ${var.environment}.
    
    @${var.notification_channel}
  EOT

  query = "avg(last_5m):p95:trace.http.request.duration{service:${var.service_name},env:${var.environment}} > ${var.latency_threshold_critical}"

  monitor_thresholds {
    critical = var.latency_threshold_critical
    warning  = var.latency_threshold_warning
  }

  notify_no_data    = false
  renotify_interval = var.renotify_interval

  tags = concat(
    var.tags,
    [
      "service:${var.service_name}",
      "env:${var.environment}",
      "monitor_type:latency",
      "managed_by:terraform"
    ]
  )
}