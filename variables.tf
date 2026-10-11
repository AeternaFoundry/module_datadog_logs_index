variable "logs_indices" {
  description = <<EOT
Map of logs_indices, attributes below
Required:
    - name
    - filter (block):
        - query (required)
Optional:
    - daily_limit
    - daily_limit_warning_threshold_percentage
    - disable_daily_limit
    - flex_retention_days
    - retention_days
    - tags
    - daily_limit_reset (block):
        - reset_time (required)
        - reset_utc_offset (required)
    - exclusion_filter (block):
        - filter (optional, block):
            - query (optional)
            - sample_attribute (optional)
            - sample_rate (optional)
        - is_enabled (optional)
        - name (optional)
EOT

  type = map(object({
    name                                     = string
    daily_limit                              = optional(number)
    daily_limit_warning_threshold_percentage = optional(number)
    disable_daily_limit                      = optional(bool)
    flex_retention_days                      = optional(number)
    retention_days                           = optional(number)
    tags                                     = optional(set(string))
    filter = object({
      query = string
    })
    daily_limit_reset = optional(object({
      reset_time       = string
      reset_utc_offset = string
    }))
    exclusion_filter = optional(list(object({
      filter = optional(list(object({
        query            = optional(string)
        sample_attribute = optional(string)
        sample_rate      = optional(number)
      })))
      is_enabled = optional(bool)
      name       = optional(string)
    })))
  }))
}

