## Overview

<!-- Sensu Integration description; supports markdown -->

The [AWS RDS] integration collects RDS metrics from [AWS CloudWatch], and alerts on various Lamda conditions.

<!-- Provide a high level overview of the integration contents (e.g. checks, filters, mutators, handlers, assets, etc) -->

This integration includes the following resources:

* `aws-rds-metrics` [check]
* `sensu/sensu-cloudwatch-check:0.3.0` [asset] 


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

This integration collects several [Amazon CloudWatch metrics for Amazon RDS] (i.e. `AWS/RDS` metrics).
Please refer to the [Amazon CloudWatch metrics for Amazon RDS] reference documentation for descriptions of each metric.

[Overview of monitoring metrics in Amazon RDS] https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html
[Amazon CloudWatch metrics for Amazon RDS]: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-metrics.html

<!-- List of all metrics or events collected by this integration. -->

This integration collects the following [metrics]:

| **Metric name** | **Description** | **Tags** |
|-----------------|-----------------|----------|
| `aws_rds_cpu_utilization_average` | The average percentage of CPU utilization during the time period. | DBInstanceIdentifier, DatabaseClass, EngineName, SourceRegion |
| `aws_rds_cpu_utilization_maximum` | The minimum percentage of CPU utilization during the time period. | DBInstanceIdentifier, DatabaseClass, EngineName, SourceRegion |
| `aws_rds_cpu_utilization_minimum` | The minimum percentage of CPU utilization during the time period. | DBInstanceIdentifier, DatabaseClass, EngineName, SourceRegion |
| `aws_rds_freeable_memory_average` | The average bytes of available random access memory during the time period. | DBInstanceIdentifier, DatabaseClass, EngineName, SourceRegion |
| `aws_rds_freeable_memory_maximum` | The minimum bytes of available random access memory during the time period. | DBInstanceIdentifier, DatabaseClass, EngineName, SourceRegion |
| `aws_rds_freeable_memory_minimum` | The minimum bytes of available random access memory during the time period. | DBInstanceIdentifier, DatabaseClass, EngineName, SourceRegion |
| `aws_rds_free_strorage_space_average` | The average bytes of available storage space during the time period. | DBInstanceIdentifier, DatabaseClass, EngineName, SourceRegion |
| `aws_rds_free_strorage_space_maximum` | The minimum bytes of available storage space during the time period. | DBInstanceIdentifier, DatabaseClass, EngineName, SourceRegion |
| `aws_rds_free_strorage_space_minimum` | The minimum bytes of available storage space during the time period. | DBInstanceIdentifier, DatabaseClass, EngineName, SourceRegion |

## Alerts

<!-- List of all alerts generated by this integration. -->

This integration produces the following events which should be processed by an alert or incident management [pipeline]:

* `cpu_utilization WARNING`

Produces a warning when CPU utilization is over a warning threshold (default: 80%)
* `cpu_utilization CRITICAL`
Produces a warning when CPU utilization is over a critical threshold (default: 90%)


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
[{{asset_name}}-bonsai]: #
[{{asset_name}}-github]: #