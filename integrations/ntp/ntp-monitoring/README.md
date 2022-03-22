## Overview

The ntp-monitoring integration provides monitoring for NTP services.

This integration includes the following resources:

* "ntp-monitoring" [check]
* "nixwiz/check-ntp" [asset]

## Dashboards

There are no compatible dashboards for this integration.

## Setup

1. Add the `ntp` subscription to one or more agents that should run this check.

1. Optionally set the `check_ntp_warn` and `check_ntp_crit` agent [annotations] to override the default value.

## Plugins

- [sensu/check-ntp][nixwiz/check-ntp-bonsai] ([GitHub][nixwiz/check-ntp-github])

## Metrics & Events

## Alerts

This integration produces the following events which should be processed by an alert or incident management [pipeline]:

* `WARNING`

NTP Offset exceeds warning threshold

* `CRITICAL`

NTP Offset exceeds critical threshold

Failed to extract NTP statistics

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
[annotations]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/#general-configuration-flags
[plugins]: https://docs.sensu.io/sensu-go/latest/plugins/
[metrics]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/metrics/
[handler]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/handlers/
[pipeline]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/pipelines/
[secret]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[secrets]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[tokens]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/tokens/
[sensu-plus]: https://sensu.io/features/analytics
[nixwiz/check-ntp-bonsai]: https://bonsai.sensu.io/assets/nixwiz/check-ntp
[nixwiz/check-ntp-github]: https://github.com/sensu/check-ntp
