output "logs_indices_id" {
  description = "Map of id values across all logs_indices, keyed the same as var.logs_indices except keys with no id are omitted"
  value       = { for k, v in datadog_logs_index.logs_indices : k => v.id if v.id != null && length(v.id) > 0 }
}
output "logs_indices_daily_limit" {
  description = "Map of daily_limit values across all logs_indices, keyed the same as var.logs_indices except keys with no daily_limit are omitted"
  value       = { for k, v in datadog_logs_index.logs_indices : k => v.daily_limit if v.daily_limit != null }
}
output "logs_indices_daily_limit_reset" {
  description = "Map of daily_limit_reset values across all logs_indices, keyed the same as var.logs_indices except keys with no daily_limit_reset are omitted"
  value       = { for k, v in datadog_logs_index.logs_indices : k => one(v.daily_limit_reset) if v.daily_limit_reset != null && length(v.daily_limit_reset) > 0 }
}
output "logs_indices_daily_limit_warning_threshold_percentage" {
  description = "Map of daily_limit_warning_threshold_percentage values across all logs_indices, keyed the same as var.logs_indices except keys with no daily_limit_warning_threshold_percentage are omitted"
  value       = { for k, v in datadog_logs_index.logs_indices : k => v.daily_limit_warning_threshold_percentage if v.daily_limit_warning_threshold_percentage != null }
}
output "logs_indices_disable_daily_limit" {
  description = "Map of disable_daily_limit values across all logs_indices, keyed the same as var.logs_indices except keys with no disable_daily_limit are omitted"
  value       = { for k, v in datadog_logs_index.logs_indices : k => v.disable_daily_limit if v.disable_daily_limit != null }
}
output "logs_indices_exclusion_filter" {
  description = "Map of exclusion_filter values across all logs_indices, keyed the same as var.logs_indices except keys with no exclusion_filter are omitted"
  value       = { for k, v in datadog_logs_index.logs_indices : k => v.exclusion_filter if v.exclusion_filter != null && length(v.exclusion_filter) > 0 }
}
output "logs_indices_filter" {
  description = "Map of filter values across all logs_indices, keyed the same as var.logs_indices except keys with no filter are omitted"
  value       = { for k, v in datadog_logs_index.logs_indices : k => one(v.filter) if v.filter != null && length(v.filter) > 0 }
}
output "logs_indices_flex_retention_days" {
  description = "Map of flex_retention_days values across all logs_indices, keyed the same as var.logs_indices except keys with no flex_retention_days are omitted"
  value       = { for k, v in datadog_logs_index.logs_indices : k => v.flex_retention_days if v.flex_retention_days != null }
}
output "logs_indices_name" {
  description = "Map of name values across all logs_indices, keyed the same as var.logs_indices except keys with no name are omitted"
  value       = { for k, v in datadog_logs_index.logs_indices : k => v.name if v.name != null && length(v.name) > 0 }
}
output "logs_indices_retention_days" {
  description = "Map of retention_days values across all logs_indices, keyed the same as var.logs_indices except keys with no retention_days are omitted"
  value       = { for k, v in datadog_logs_index.logs_indices : k => v.retention_days if v.retention_days != null }
}
output "logs_indices_tags" {
  description = "Map of tags values across all logs_indices, keyed the same as var.logs_indices except keys with no tags are omitted"
  value       = { for k, v in datadog_logs_index.logs_indices : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

