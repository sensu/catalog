## Overview

Collect metrics on and monitor SSL certificates.

This integration includes the following resources:

* `ssl-cert-monitoring` [check]
* `sensu/cert-checks` [asset]

## Dashboards

There are no compatible dashboards for this integration.

## Setup

1. Add the `ssl` subscription to agents that should run this check.

## Plugins

- [sensu/cert-checks][cert-checks-bonsai] ([GitHub][cert-checks-github])

## Metrics & Events

This integration collects the following [metrics]:

| **Metric name** | **Description** | **Tags** |
|-----------------|-----------------|----------|
| `cert_days_left` | Number of days until certificate expiry. Expired certificates produce a negative number. | `servername`, `subject` |
| `cert_seconds_left` | Number of seconds until certificate expiry. Expired certificates produce a negative number. | `servername`, `subject` |
| `cert_issued_days` | Number of days the certificate has been issued. | `servername`, `subject` |
| `cert_issued_seconds` | Number of seconds the certificate has been issued. | `servername`, `subject` |

## Alerts

This integration uses `output_metric_threshold`s (new in Sensu Go version 6.7.0) to trigger the following alerts:

* SSL Certificate Expiry events

  Will generate alerts and/or incidents using the configured pipelines when a SSL Certificate is nearing expiry.

  * **Default Behaviour**: will issue a `WARNING` status event if `cert_days_left` is 15 days or less, and a `CRITICAL` status event if `cert_days_left` is 7 days or less.

* SSL Configuration configuration events

  Will generate alerts and/or incidents using the configured pipelines when a SSL Certificate has been issued for too many days (which may lead it to not be accepted by many clients).

  * **Default Behaviour**: will issue a `CRITICAL` status event if `cert_issued_days` is greater than 398 days (read [this article](https://thehackernews.com/2020/09/ssl-tls-certificate-validity-398.html)).

## Reference Documentation

* [Maximum Lifespan of SSL/TLS Certificates is 398 Days Starting Today](https://thehackernews.com/2020/09/ssl-tls-certificate-validity-398.html)
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
[cert-checks-bonsai]: https://bonsai.sensu.io/assets/sensu/cert-checks
[cert-checks-github]: https://github.com/sensu/cert-checks
