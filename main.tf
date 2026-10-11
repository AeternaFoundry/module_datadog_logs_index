resource "datadog_logs_index" "logs_indices" {
  for_each = var.logs_indices

  name                                     = each.value.name
  daily_limit                              = each.value.daily_limit
  daily_limit_warning_threshold_percentage = each.value.daily_limit_warning_threshold_percentage
  disable_daily_limit                      = each.value.disable_daily_limit
  flex_retention_days                      = each.value.flex_retention_days
  retention_days                           = each.value.retention_days
  tags                                     = each.value.tags

  filter {
    query = each.value.filter.query
  }

  dynamic "daily_limit_reset" {
    for_each = each.value.daily_limit_reset != null ? [each.value.daily_limit_reset] : []
    content {
      reset_time       = daily_limit_reset.value.reset_time
      reset_utc_offset = daily_limit_reset.value.reset_utc_offset
    }
  }

  dynamic "exclusion_filter" {
    for_each = each.value.exclusion_filter != null ? each.value.exclusion_filter : []
    content {
      dynamic "filter" {
        for_each = exclusion_filter.value.filter != null ? exclusion_filter.value.filter : []
        content {
          query            = filter.value.query
          sample_attribute = filter.value.sample_attribute
          sample_rate      = filter.value.sample_rate
        }
      }
      is_enabled = exclusion_filter.value.is_enabled
      name       = exclusion_filter.value.name
    }
  }
}

