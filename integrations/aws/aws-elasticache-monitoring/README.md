## Overview

<!-- Sensu Integration description; supports markdown -->

The [AWS ElastiCache Redis] monitoring integration collects ElastiCache metrics from [AWS CloudWatch], and alerts on various theshold conditions.

[AWS ElastiCache]: https://aws.amazon.com/elasticache/
[AWS CloudWatch]: https://aws.amazon.com/cloudwatch/

<!-- Provide a high level overview of the integration contents (e.g. checks, filters, mutators, handlers, assets, etc) -->

This integration includes the following resources:

* `aws-elasticache-metrics` [check]
* `sensu/sensu-cloudwatch-check:0.2.0` [asset]

## Dashboards

<!-- List of compatible dashboards w/ screenshots (supports png, jpeg, and gif images; relative paths only; e.g. `![](img/dashboard-1.png)` )-->

<!-- This integration is compatible with the [{{dashboard_name}}][{{dashboard_link}}] (included w/ [Sensu Plus][sensu-plus]). -->

<!-- ![](img/dashboard.png) -->

There are no compatible dashboards for this integration.

## Setup

<!-- Sensu Integration setup instructions, including Sensu agent configuration and external component configuration -->
<!-- EXAMPLE: what configuration (if any) is required in a third-party service to enable monitoring? -->

1. This integration requires access to AWS CloudWatch APIs.

   All forms of AWS authentication supported by the [AWS CLI] are supported, including [EC2 IAM Instance Profiles]. This integration requires read-only access to AWS CloudWatch (e.g. `arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess`).

   `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` secret(s) or environment variable(s) are not needed if the check(s) from this integration are run on a `sensu-agent` installed on an EC2 instance with an IAM Instance Profile containing the `arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess`.

[AWS CLI]: https://aws.amazon.com/cli/
[EC2 IAM Instance Profiles]: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html

## Plugins

<!-- Links to any Sensu Integration dependencies (i.e. Sensu Plugins) -->

- [sensu/sensu-cloudwatch-check][sensu-cloudwatch-check-bonsai] ([GitHub][sensu-cloudwatch-check-github])

## Metrics & Events

<!-- List of all metrics or events collected by this integration. -->

This integration collects a subset of available [CloudWatch AWS ElastiCache metrics] (i.e. `AWS/ElastiCache` metrics).
Please refer to the [Monitoring ElastiCache Memcached with CloudWatch metrics] and [Monitoring ElastiCache Redis with CloudWatch metrics] reference documentation for descriptions of each metric.

[Monitoring ElastiCache Memcached with CloudWatch metrics](https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/CacheMetrics.html)
[Monitoring ElastiCache Redis with CloudWatch metrics](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/CacheMetrics.html)


| **Metric name** | **Tags** |
|-----------------|----------|
| **`aws_elasticache_curr_volatile_items`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_active_defrag_hits_average`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_active_defrag_hits_maximum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_active_defrag_hits_minimum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_database_memory_usage_percentage_average`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_database_memory_usage_percentage_maximum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_database_memory_usage_percentage_minimum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_new_connections`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_freeable_memory_average`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_freeable_memory_maximum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_freeable_memory_minimum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_network_bytes_in`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_is_master`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_cpu_utilization_average`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_cpu_utilization_maximum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_cpu_utilization_minimum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_engine_cpu_utilization_average`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_engine_cpu_utilization_maximum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_engine_cpu_utilization_minimum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_replication_lag_average`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_replication_lag_maximum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_replication_lag_minimum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_bytes_used_for_cache_average`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_bytes_used_for_cache_maximum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_bytes_used_for_cache_minimum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_key_based_cmds`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_cache_hits`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_reclaimed`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_network_packets_in`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_master_link_health_status`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_evictions`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_set_type_cmds`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_save_in_progress`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_network_bytes_out`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_cache_misses`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_replication_bytes_average`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_replication_bytes_maximum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_replication_bytes_minimum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_curr_items`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_database_memory_usage_counted_for_evict_percentage_average`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_database_memory_usage_counted_for_evict_percentage_maximum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_database_memory_usage_counted_for_evict_percentage_minimum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_swap_usage_average`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_swap_usage_maximum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_swap_usage_minimum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_network_packets_out`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_memory_fragmentation_ratio_average`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_memory_fragmentation_ratio_maximum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_memory_fragmentation_ratio_minimum`** | `CacheClusterId`, `CacheNodeId` |
| **`aws_elasticache_curr_connections`** | `CacheClusterId`, `CacheNodeId` |

## Alerts

<!-- List of all alerts generated by this integration. -->

This integration produces the following events which should be processed by an alert or incident management [pipeline]:

* CpuUtilization

  <!-- Description of the alert condition. -->

  A warning is generated when `aws_elasticache_cpu_utilization_maximum` is greater than a user-configurable minimum value (default: 90).

## Reference Documentation

<!-- Please provide links to any relevant reference documentation to help users learn more and/or troubleshoot this integration; specifically including any third-party software documentation. -->

1. This integration uses [Sensu Tokens][tokens] for variable substitution.

<!-- Links -->
[check]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/checks/
[asset]: https://docs.sensu.io/sensu-go/latest/plugins/assets/
[subscription]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/subscriptions/
[subscriptions]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/subscriptions/
[agents]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/
[annotation]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/#general-configuration-flags
[plugins]: https://docs.sensu.io/sensu-go/latest/plugins/
[metrics]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/metrics/
[handler]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/handlers/
[pipeline]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/pipelines/
[secret]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[secrets]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[tokens]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/tokens/
[sensu-plus]: https://sensu.io/features/analytics
[{{dashboard-link}}]: #
[sensu-cloudwatch-check-bonsai]: https://bonsai.sensu.io/assets/sensu/sensu-cloudwatch-check
[sensu-cloudwatch-check-github]: https://github.com/sensu/sensu-cloudwatch-check
