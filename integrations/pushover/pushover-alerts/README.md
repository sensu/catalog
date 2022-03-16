## Overview

The pushover-alerts integration provides a pipeline for sending Sensu Incidents
as a Pushover Notification.

This integration includes the following resources:

* `pushover-alerts` [pipeline]
* `pushover-alerts` [handler]
* `nixwiz/sensu-go-pushover-handler` [asset]

## Dashboards

There are no compatible dashboards for this integration.

## Setup

1. Set up a Pushover User Account and devices at https://pushover.net/

1. Create a new [Pushover Application/API Token][pushover-registration]

1. Install this Sensu Integration, providing Pushover User Key and API Token.

1. Configure Sensu Checks to use the `pushover-alerts` pipeline.

## Plugins


- [nixwiz/sensu-go-pushover-handler][sensu-go-pushover-handler-bonsai] ([GitHub][sensu-go-pushover-handler-github])

## Metrics & Events


This integration does not produce any [metrics].

## Alerts

This integration does not produce any events that should be processed by an alert or incident management [pipeline].

## Reference Documentation

1. [Sensu Secrets Documentation][secret]: This integration places your pushover credentials directly into sensu configuration.
In order to follow our recommended security practices please see our secret provider options.

1. Pushover Documentation: [home page][pushover-home]

1. Pushover Documentation: [adding an application token][pushover-registration]

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
[sensu-go-pushover-handler-bonsai]: https://bonsai.sensu.io/assets/nixwiz/sensu-go-pushover-handler
[sensu-go-pushover-handler-github]: https://github.com/nixwiz/sensu-go-pushover-handler
[pushover-home]: https://pushover.net
[pushover-registration]: https://pushover.net/api#registration
