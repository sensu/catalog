## Overview

<!-- Sensu Integration description; supports markdown -->

The {{integration_name}} integration provides {{integration_description}}.

<!-- Provide a high level overview of the integration contents (e.g. checks, filters, mutators, handlers, assets, etc) -->

This integration includes the following resources:

* "{{check_name}}" [check]
* "{{asset_name}}" [asset]

## Dashboards

<!-- List of supported dashboards w/ screenshots (supports png, jpeg, and gif images; relative paths only; e.g. `![](img/dashboard-1.png)` )-->

This integration is compatible with the [{{dashboard_name}}][{{dashboard_link}}] (included w/ [Sensu Plus][sensu-plus]).

![](img/dashboard.png)

## Setup

<!-- Sensu Integration setup instructions, including Sensu agent configuration and external component configuration -->
<!-- EXAMPLE: what configuration (if any) is required in a third-party service to enable monitoring? -->

1. Add one of the following [subscriptions] to [agents] that should run this check.

   * `{{subscription}}`

1. Optionally set the `{{token_name}}` agent [annotation] to override the default value (`{{token_default}}`).

## Plugins

<!-- Links to any Sensu Integration dependencies (i.e. Sensu Plugins) -->

- [sensu/{{asset_name}}][{{asset_name}}-bonsai] ([GitHub][{{asset_name}}-github])

## Metrics & Events

<!-- List of all metrics or events collected by this integration. -->

This integration collects the following [metrics]:

* `{{metric_name}}`

  {{metric_description}}

  Tags: {{metric_tags}}

## Alerts

<!-- List of all alerts generated by this integration. -->

This integration produces the following events which should be processed by an alert or incident management [handler]:

* `Example`

  {{Description of the alert}}

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
[tokens]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/tokens/
[sensu-plus]: https://sensu.io/features/analytics
[{{dashboard-link}}]: #
[{{asset-name}}-bonsai]: #
[{{asset-name}}-github]: #