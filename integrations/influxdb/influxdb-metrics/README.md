## Overview

The `influxdb-metrics` integration provides a Sensu pipeline for sending metrics
to the time series database InfluxDB. This integration provides the following
resources:

* `influxdb` [handler]
* `influxdb-metrics` [pipeline]
* `sensu/sensu-influx-handler` [asset]

## Dashboards

<!-- List of supported dashboards w/ screenshots (supports png, jpeg, and gif images; relative paths only; e.g. `![](img/dashboard-1.png)` )-->

There are no supported dashboards for this integration.

## Setup

1. Configure the following secrets using your preferred Sensu Go [Secrets](secret):
   provider:
      - influxdb_url (e.g. "http://127.0.0.1:8086")
      - influxdb_db (e.g. "sensu")
      - influxdb_user (e.g. "sensu")
      - influxdb_password (e.g. "replaceme")
      
1. Configure Sensu [checks][check] to use the `influxdb-metrics` [pipeline]

# Plugins

This integration uses the `sensu-influxdb-handler`:
- [sensu-influxdb-handler on Github](https://github.com/sensu/sensu-influxdb-handler)
- [sensu/sensu-influxdb-handler on Bonsai](https://bonsai.sensu.io/assets/sensu/sensu-influxdb-handler)

## Metrics & Events

<!-- List of all metrics or events collected by this integration. -->

This integration does not produce any [metrics].

## Alerts

This integration does not produce any events that should be processed by an alert or incident management [handler].

## Reference Documentation

<!-- Please provide links to any relevant reference documentation to help users learn more and/or troubleshoot this integration. -->

1. This plugin uses a [Sensu Token][tokens] for variable substitution.

<!-- Links -->
[check]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/checks/
[asset]: https://docs.sensu.io/sensu-go/latest/plugins/assets/
[subscription]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/subscriptions/
[agents]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/
[annotation]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/#general-configuration-flags
[plugins]: https://docs.sensu.io/sensu-go/latest/plugins/
[metrics]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/metrics/
[handler]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/handlers/
[tokens]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/tokens/
[secret]: https://docs.sensu.io/sensu-go/latest/reference/secrets/
[pipeline]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/pipelines/
