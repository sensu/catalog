## Overview

The `influxdb-metrics` integration provides a Sensu pipeline for sending metrics
to the InfluxDB time series database. This integration is compatible with InfluxDB versions 1.x.

This integration provides the following resources:

* `influxdb` [handler]
* `influxdb-metrics` [pipeline]
* `sensu/sensu-influx-handler` [asset]

## Dashboards

<!-- List of supported dashboards w/ screenshots (supports png, jpeg, and gif images; relative paths only; e.g. `![](img/dashboard-1.png)` )-->

There are no supported dashboards for this integration.

## Setup

1. To process metrics with InfluxDB, install this integration, then modify one or more Sensu [checks][check] to use the `influxdb-metrics` [pipeline].

   ```yaml
   spec:
      ...: ...
      pipelines:
        - api_version: core/v2
           type: Pipeline
           name: influxdb-metrics
   ```
## InfluxDBv2 Compatibility
This plugin was written for InfluxDB 1.x databases, but it is possible to have it work with InfluxDB 2.0 buckets by configuring an Influx DBRP mapping in your InfluxDB 2.0 server.

Ref: https://docs.influxdata.com/influxdb/v2.0/tools/grafana/?t=InfluxQL#view-and-create-influxdb-dbrp-mappings

When using InfluxQL to query InfluxDB, the query must specify a database and a retention policy. InfluxDB DBRP mappings associate database and retention policy combinations with InfluxDB 2.0 buckets. DBRP mappings do not affect the retention period of the target bucket. These mappings allow queries following InfluxDB 1.x conventions to successfully query InfluxDB 2.0 buckets.
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
