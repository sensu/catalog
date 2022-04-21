## Overview

<!-- Sensu Integration description; supports markdown -->

The [AWS Lambda] monitoring integration collects Lambda metrics from [AWS CloudWatch], and alerts on various Lamda conditions.

[AWS Lambda]: https://aws.amazon.com/lambda/
[AWS CloudWatch]: https://aws.amazon.com/cloudwatch/

<!-- Provide a high level overview of the integration contents (e.g. checks, filters, mutators, handlers, assets, etc) -->

This integration includes the following resources:

* `aws-lambda-metrics` [check]
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

This integration collects dozens of [CloudWatch AWS Lambda metrics] (i.e. `AWS/Lambda` metrics).
Please refer to the [Working with Lambda function metrics] reference documentation for descriptions of each metric.

[Working with Lambda function metrics ]: https://docs.aws.amazon.com/lambda/latest/dg/monitoring-metrics.html

| **Metric name** | **Tags** |
|-----------------|----------|
| **`aws_lambda_unreserved_concurrent_executions_average`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_unreserved_concurrent_executions_maximum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_unreserved_concurrent_executions_minimum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_concurrent_executions_average`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_concurrent_executions_maximum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_concurrent_executions_minimum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_provisioned_concurrent_executions_average`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_provisioned_concurrent_executions_maximum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_provisioned_concurrent_executions_minimum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_provisioned_concurrency_utilization_average`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_provisioned_concurrency_utilization_maximum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_provisioned_concurrency_utilization_minimum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_invocations`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_errors`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_dead_letter_errors`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_destination_delivery_failures`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_throttles`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_provisioned_concurrency_invocations`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_provisioned_concurrency_spillover_invocations`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_post_runtime_extensions_duration_average`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_post_runtime_extensions_duration_maximum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_post_runtime_extensions_duration_minimum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_iterator_age_average`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_iterator_age_maximum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_iterator_age_minimum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_offset_lag_average`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_offset_lag_maximum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_offset_lag_minimum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_duration_average`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_duration_maximum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |
| **`aws_lambda_duration_minimum`** | `FunctionName`, `Resource`, `Region`, `ExecutedVersion` |

## Alerts

<!-- List of all alerts generated by this integration. -->

This integration produces the following events which should be processed by an alert or incident management [pipeline]:

* Errors

  <!-- Description of the alert condition. -->

  A warning is generated when `aws_lambda_errors` is greater than a user-configurable minimum value (default: 0).

* Throttles

  <!-- Description of the alert condition. -->

  A warning is generated when `aws_lambda_throttles` is greater than a user-configurable minimum value (default: 0).

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
