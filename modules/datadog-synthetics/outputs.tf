output "synthetic_test_id" {
  description = "ID of the synthetic test"
  value       = datadog_synthetics_test.api_test.id
}

output "synthetic_test_monitor_id" {
  description = "Monitor ID of the synthetic test"
  value       = datadog_synthetics_test.api_test.monitor_id
}