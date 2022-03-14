## Overview

The aws-sns-events integration provides a pipeline for sending Sensu Incidents to an AWS SNS Topic.


This integration includes the following resources:

* `aws-sns-events` [pipeline]
* `aws-sns-events` [handler]
* `sensu-aws-sns-handler` [asset]

## Dashboards

There are no compatible dashboards for this integration.

## Setup

1. Configure a new AWS SNS Topic.

This integration will require the SNS Topic ARN.

1. Create an AWS User and Access Keys with appropriate IAM Roles for Sensu.

At a minimum, this integration requires the `sns:Publish` action for the SNS Topic Resource created above.

## Plugins


- [sensu/sensu-aws-sns-handler][sensu-aws-sns-handler-bonsai] ([GitHub][sensu-aws-sns-handler-github])

## Reference Documentation

1. This integration uses [Handler Templating][handler-templating] for variable substitution.

1. This integration places AWS access credentials directly into sensu configuration.
In order to follow our reccomended security practices please reference the [sensu secrets documentation][secrets]. 

<!-- Links -->
[check]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/checks/
[asset]: https://docs.sensu.io/sensu-go/latest/plugins/assets/
[subscription]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/subscriptions/
[subscriptions]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/subscriptions/
[agents]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/
[annotation]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/#general-configuration-flags
[plugins]: https://docs.sensu.io/sensu-go/latest/plugins/
[metrics]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/metrics/
[pipeline]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/pipelines/
[handler]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/handlers/
[secret]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[secrets]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[tokens]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/tokens/
[handler-templating]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/handler-templates/
[sensu-plus]: https://sensu.io/features/analytics
[sensu-aws-sns-handler-bonsai]: https://bonsai.sensu.io/assets/sensu/sensu-aws-sns-handler/versions/0.4.0?tab=definition
[sensu-aws-sns-handler-github]: https://github.com/sensu/sensu-aws-sns-handler
