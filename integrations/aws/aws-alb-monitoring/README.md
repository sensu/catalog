## Overview

<!-- Sensu Integration description; supports markdown -->

The [AWS Application Load Balancer (ALB)] monitoring integration collects ALB metrics from [AWS CloudWatch], and alerts on various ALB conditions.

[AWS Application Load Balancer (ALB)]: https://aws.amazon.com/elasticloadbalancing/application-load-balancer/
[AWS CloudWatch]: https://aws.amazon.com/cloudwatch/

<!-- Provide a high level overview of the integration contents (e.g. checks, filters, mutators, handlers, assets, etc) -->

This integration includes the following resources:

* `aws-alb-metrics` [check]
* `sensu/sensu-cloudwatch-check:0.1.0` [asset]

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

This integration collects dozens of [CloudWatch AWS ALB metrics] (i.e. `AWS/ApplicationELB` metrics).
Please refer to the [CloudWatch metrics for your Application Load Balancer] reference documentation for descriptions of each metric.

[CloudWatch AWS ALB metrics]: https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-cloudwatch-metrics.html
[CloudWatch metrics for your Application Load Balancer]: https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-cloudwatch-metrics.html

| **Metric name** | **Tags** |
|-----------------|----------|
| **`aws_alb_active_connection_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_client_tls_negotiation_error_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_target_tls_negotiation_error_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_desync_mitigation_mode_noncompliant_request_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_grpc_request_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_http_fixed_response_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_http_redirect_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_http_redirect_url_limit_exceeded_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_httpcode_elb_3xx_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_httpcode_elb_4xx_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_httpcode_elb_5xx_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_httpcode_elb_500_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_httpcode_elb_502_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_httpcode_elb_503_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_httpcode_elb_504_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_httpcode_target_2xx_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_httpcode_target_3xx_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_httpcode_target_4xx_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_httpcode_target_5xx_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_ipv6_processed_bytes`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_ipv6_request_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_new_connection_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_target_connection_error_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_target_response_time_average`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_target_response_time_p95`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_target_response_time_tm95`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_non_sticky_request_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_processed_bytes`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_rejected_connection_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_request_count_per_target`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_elb_auth_error`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_elb_auth_failure`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_elb_auth_refresh_token_success`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_elb_auth_success`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_elb_auth_user_claims_size_exceeded`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_elb_auth_latency`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_elb_auth_latency_sample_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_elb_auth_latency_maximum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_elb_auth_latency_minimum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_elb_auth_latency_average`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_lambda_internal_error`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_lambda_target_processed_bytes`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_lambda_user_error`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_request_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_rule_evaluations`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_consumed_lcus_sum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_consumed_lcus_sample_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_consumed_lcus_maximum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_consumed_lcus_minimum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_consumed_lcus_average`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_healthy_host_count_maximum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_healthy_host_count_minimum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_healthy_host_count_average`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_unhealthy_host_count_maximum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_unhealthy_host_count_minimum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_unhealthy_host_count_average`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_dropped_invalid_header_requests_sum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_dropped_invalid_header_requests_sample_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_dropped_invalid_header_requests_maximum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_dropped_invalid_header_requests_minimum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_dropped_invalid_header_requests_average`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_forwarded_invalid_header_requests_sum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_forwarded_invalid_header_requests_sample_count`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_forwarded_invalid_header_requests_maximum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_forwarded_invalid_header_requests_minimum`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |
| **`aws_alb_forwarded_invalid_header_requests_average`** | `LoadBalancer`, `TargetGroup`, `Region`, `AvailabilityZone` |


## Alerts

<!-- List of all alerts generated by this integration. -->

This integration produces the following events which should be processed by an alert or incident management [pipeline]:

* HealthyHostCountMinimum

  <!-- Description of the alert condition. -->

  A warning is generated when `aws_alb_healthy_host_count_minimum` falls below a user-configurable minimum value (default: 1).

* UnhealthyHostCountMaximum

  <!-- Description of the alert condition. -->

  A warning is generated when `aws_alb_unhealthy_host_count_maximum` is greater than a user-configurable minimum value (default: 0).

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
