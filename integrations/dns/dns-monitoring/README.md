## Overview

Collect metrics on and monitor DNS server query resolution.

This integration includes the following resources:

* `dns-monitoring` [check]
* `sensu/dns-check` [asset]

## Dashboards

There are no compatible dashboards for this integration.

## Setup

1. [OPTIONAL] Set `sensu.io/plugins/dns-check/config/*` agent [annotations] to override the default values on a per-host basis.

   Example `agent.yml` snippet:

   ```yaml
   annotations:
     sensu.io/plugins/dns-check/config/server: "1.1.1.1,1.0.0.1"
   ```

   Available configuration overrides:

    * `sensu.io/plugins/dns-check/config/server`

       Resolver(s) to Monitor

    * `sensu.io/plugins/dns-check/config/port`

       DNS Service port if not `53`.

    * `sensu.io/plugins/dns-check/config/tcp`

       Force TCP by setting to true.

## Plugins

- [sensu/dns-check][dns-check-bonsai] ([GitHub][dns-check-github])

## Metrics & Events

This integration collects the following [metrics]:

| **Metric name** | **Description** | **Tags** |
|-----------------|-----------------|----------|
| `dns_resolved` | binary result `0` when the query can be resolved, otherwise `1` | `servername`, `domain`, `record_class`, `record_type` |
| `dns_response_time` | round trip response time to resolve the query in seconds | `servername`, `domain`, `record_class`, `record_type` |
| `dns_secure` | binary result `0` when the server indicates dnssec signatures were validated, otherwise `1` | `servername`, `domain`, `record_class`, `record_type` |

## Alerts

This integration uses `output_metric_threshold`s (new in Sensu Go version 6.7.0) to trigger the following alerts:

* DNS resolver events

  Will generate alerts and/or incidents using the configured pipelines when a DNS record cannot be resolved.

* DNSSEC configuration events

  Will generate alerts and/or incidents using the configured pipelines when DNSSEC is not enabled.

## Reference Documentation

* [Round-robin check scheduling reference documentation](https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/checks/#round-robin-checks)
* [Proxy entity reference documentation](https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-entities/entities/#create-and-manage-proxy-entities)

<!-- Links -->
[check]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/checks/
[asset]: https://docs.sensu.io/sensu-go/latest/plugins/assets/
[subscription]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/subscriptions/
[subscriptions]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/subscriptions/
[agents]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/
[annotations]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/#general-configuration-flags
[plugins]: https://docs.sensu.io/sensu-go/latest/plugins/
[metrics]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/metrics/
[handler]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/handlers/
[pipeline]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/pipelines/
[secret]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[secrets]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[tokens]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/tokens/
[sensu-plus]: https://sensu.io/features/analytics
[metric-threshold-rule]: #
[dns-check-bonsai]: https://bonsai.sensu.io/assets/sensu/dns-check
[dns-check-github]: https://github.com/sensu/dns-check
