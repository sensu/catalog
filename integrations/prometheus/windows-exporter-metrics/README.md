## Overview

<!-- Sensu Integration description; supports markdown -->

The Prometheus `windows_exporter` metrics integration provides metrics from hosts running the [Prometheus `windows_exporter`](https://github.com/prometheus-community/windows_exporter#readme) (Windows hosts).

Use the related [Prometheus `node_exporter`](https://github.com/prometheus/node_exporter#readme) integration for Linux/macOS hosts.

<!-- Provide a high level overview of the integration contents (e.g. checks, filters, mutators, handlers, assets, etc) -->

This integration includes the following resources:

* `windows-exporter-metrics` [check]
* `sensu/http-checks:0.7.0` [asset]

## Dashboards

<!-- List of compatible dashboards w/ screenshots (supports png, jpeg, and gif images; relative paths only; e.g. `![](img/dashboard-1.png)` )-->

<!-- This integration is compatible with the [{{dashboard_name}}][{{dashboard_link}}] (included w/ [Sensu Plus][sensu-plus]). -->

<!-- ![](img/dashboard.png) -->

There are no compatible dashboards for this integration.

## Setup

<!-- Sensu Integration setup instructions, including Sensu agent configuration and external component configuration -->
<!-- EXAMPLE: what configuration (if any) is required in a third-party service to enable monitoring? -->

1. **[OPTIONAL] Configure custom request headers**

   To add custom request headers, install this integration, then modify the resulting Sensu Check resource with one or more `--header` flags.

   Example:

   ```yaml
   spec:
     command: >-
       http-get
       --timeout 10
       --url "http://127.0.0.1:9182/
       --header "Content-Type: text/plain"
       --header "X-Example-Header: helloworld"
   ```

## Plugins

<!-- Links to any Sensu Integration dependencies (i.e. Sensu Plugins) -->

- [sensu/http-checks][http-checks-bonsai] ([GitHub][http-checks-github])

## Metrics & Events

<!-- List of all metrics or events collected by this integration. -->

This integration collects a wide range of [metrics], depending on the configuration of your Prometheus `windows_exporter` and the OS version that it is running on. For a full list, see the [`windows_exporter` documentation](https://github.com/prometheus-community/windows_exporter#readme).

# Reference Documentation

<!-- Please provide links to any relevant reference documentation to help users learn more and/or troubleshoot this integration; specifically including any third-party software documentation. -->

1. This integration uses [Sensu Tokens][tokens] for variable substitution.

<!-- Links -->
[entity]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-entities/entities/
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
[http-checks-bonsai]: https://bonsai.sensu.io/assets/sensu/http-checks
[http-checks-github]: https://github.com/sensu/http-checks
