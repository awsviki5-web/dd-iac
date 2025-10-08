output "cpu_monitor_id" {
  description = "ID of the CPU monitor"
  value       = datadog_monitor.cpu.id
}

output "memory_monitor_id" {
  description = "ID of the memory monitor"
  value       = datadog_monitor.memory.id
}

output "error_rate_monitor_id" {
  description = "ID of the error rate monitor"
  value       = datadog_monitor.error_rate.id
}

output "latency_monitor_id" {
  description = "ID of the latency monitor"
  value       = datadog_monitor.latency.id
}