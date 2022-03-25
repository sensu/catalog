## Overview

Collect metrics on and monitor DNS server query resolution.

This integration includes the following resources:

* "dns-monitoring" [check]
* "sensu/dns-check" [asset]

## Dashboards

There are no compatible dashboards for this integration.

## Setup

1. Add one of the following [subscriptions] to [agents] that should run this check.

    * `dns`

1. Optionally set `sensu.io/plugins/dns-check/config/*` agent [annotations][annotation] to override the prompted values.

    * `sensu.io/plugins/dns-check/config/domain` Domain(s) to Query
    * `sensu.io/plugins/dns-check/config/server` Resolver(s) to Monitor
    * `sensu.io/plugins/dns-check/config/class` Record Class to Query
    * `sensu.io/plugins/dns-check/config/type` Record Type to Query
    * `sensu.io/plugins/dns-check/config/port` DNS Servie Port if not 53
    * `sensu.io/plugins/dns-check/config/tcp` Force TCP by setting to true

## Plugins


- [sensu/dns-check][dns-check-bonsai] ([GitHub][dns-check-github])

## Metrics & Events

This integration collects the following [metrics]:

| **Metric name** | **Description** | **Tags** |
|-----------------|-----------------|----------|
| `dns_resolved` | binary result 0 when the query can be resolved, otherwise 1 | servername, domain, record_class, record_type |
| `dns_response_time` | round trip response time to resolve the query in seconds | servername, domain, record_class, record_type |
| `dns_secure` | binary result 0 when the server indicates dnssec signatures were validated, otherwise 1 | servername, domain, record_class, record_type |

## Alerts

Uses [Metric Threshold Rules][metric-threshold-rule] to trigger alerts.

## Reference Documentation


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
[metric-threshold-rule]: #
[dns-check-bonsai]: https://bonsai.sensu.io/assets/sensu/dns-check
[dns-check-github]: https://github.com/sensu/dns-check
