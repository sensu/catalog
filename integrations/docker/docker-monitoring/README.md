## Overview

<!-- Sensu Integration description; supports markdown -->

The Docker monitoring integration collects Docker metrics via the [Docker /metrics API] and alerts on various Docker daemon conditions.

[Docker /metrics API]: https://docs.docker.com/config/daemon/prometheus/

<!-- Provide a high level overview of the integration contents (e.g. checks, filters, mutators, handlers, assets, etc) -->

This integration includes the following resources:

* `docker-daemon-metrics` [check]
* `sensu/http-checks:0.7.0` [asset]

## Dashboards

<!-- List of compatible dashboards w/ screenshots (supports png, jpeg, and gif images; relative paths only; e.g. `![](img/dashboard-1.png)` )-->

<!-- This integration is compatible with the [{{dashboard_name}}][{{dashboard_link}}] (included w/ [Sensu Plus][sensu-plus]). -->

<!-- ![](img/dashboard.png) -->

Coming soon!

## Setup

<!-- Sensu Integration setup instructions, including Sensu agent configuration and external component configuration -->
<!-- EXAMPLE: what configuration (if any) is required in a third-party service to enable monitoring? -->

1. Configure the Docker daemon to provide a metrics endpoint:

   In the `daemon.json` configuration file, ensure the following two configuration values are set:

   ```
   "metrics-addr": "127.0.0.1:9323",
   "experimental": true
   ```

   For more details on setting this up read the ["Configure Docker" section of the article "Collect Docker Metrics with Prometheus"](https://docs.docker.com/config/daemon/prometheus/#configure-docker). Note that you do not need to run Prometheus to use this endpoint, so only that one paragraph is relevant from that article.

1. **[OPTIONAL] Disable redirect warnings**

   To disable redirect warnings, install this integration, then modify the resulting Sensu Check resource with the `--redirect-ok` flag.

   Example:

   ```yaml
   spec:
     command: >-
       http-get
       --timeout 10
       --redirect-ok
       --url "http://127.0.0.1:9323/metrics"
   ```

1. **[OPTIONAL] Configure custom request headers**

   To add custom request headers, install this integration, then modify the resulting Sensu Check resource with one or more `--header` flags.

   Example:

   ```yaml
   spec:
     command: >-
       http-get
       --timeout 10
       --url "http://127.0.0.1:9323/metrics
       --header "Content-Type: text/plain"
       --header "X-Example-Header: helloworld"
   ```

## Plugins

<!-- Links to any Sensu Integration dependencies (i.e. Sensu Plugins) -->

- [sensu/http-checks][http-checks-bonsai] ([GitHub][http-checks-github])

## Metrics & Alerts

<!-- List of all metrics or events collected by this integration. -->

This integration collects a wide range of [metrics]. For a full list, see the [Docker metrics example output](https://gist.github.com/thoward/18ef24dede9203361d33b3da5beb9305).

This integration configures two alerts:

- The `engine_daemon_health_checks_failed_total` metric: This metric is a counter that indicates the total amount of failed health checks that have occured since the Docker daemon started. If there are more than five (5) failed health checks, a `WARNING` status alert will be raised, and if there are more than ten (10) failed health checks, a `CRITICAL` status alert will be raised.
- The `engine_daemon_container_states_containers{status="stopped"}` metric: This tagged metric is a gauge that indicates the current amount of stopped containers. If there are more than five (5) stopped containers, a `WARNING` status alert will be raised, and if there are more than ten (10) stopped containers, a `CRITICAL` status alert will be raised.

You can modify these threshold values to suit your environment by changing the configuration of the `docker-metrics` [Check] resource.

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
