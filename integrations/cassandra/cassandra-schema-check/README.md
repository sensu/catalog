## Overview

A check that determines if any node in the cluster is having a schema disagreement problem using Cassandra's `nodetool`.

This integration includes the following resources:

* `check-cassandra-schema` [check]
* `sensu-plugins/sensu-plugins-cassandra:3.0.2` [asset]
* `sensu/sensu-ruby-runtime:0.0.10` [asset]

<!-- ## Dashboards -->

<!-- List of supported dashboards w/ screenshots (supports png, jpeg, and gif images; relative paths only; e.g. `![](img/dashboard-1.png)` )-->

<!-- This integration is compatible with the [{{dashboard_name}}][{{dashboard_link}}] (included w/ [Sensu Plus][sensu-plus]).

![](img/dashboard.png) -->

## Setup

1. Add one of the following [subscriptions] to [agents] that should run this check.

   * `cassandra`

2. Optionally set an agent [annotation] to override the default parameters:
   * `cassandra_hostname` (default: `localhost`)
   * `cassandra_port` (default: `7199`)

For more information, please read the [plugin documentation](sensu-plugins-cassandra-github).

## Plugins

* [sensu/sensu-plugins-cassandra][sensu-plugins-cassandra-bonsai] ([GitHub][sensu-plugins-cassandra-github])
* [sensu/sensu-ruby-runtime][sensu-ruby-runtime-bonsai] ([GitHub][sensu-ruby-runtime-github])

## Alerts

This integration produces the following events which should be processed by an alert or incident management [handler]:

* `CRITICAL` Alert

  The plugin will generate a critical alert to the `alert` pipeline if the node is unreachable, or if any nodes have a schema disagreement.

## Reference Documentation

1. This integration uses [Sensu Tokens][tokens] for variable substitution.
2. Apache Cassandra Docs: [`nodetool describecluster` command](https://docs.datastax.com/en/dse/6.7/dse-admin/datastax_enterprise/tools/nodetool/toolsDescribeCluster.html)

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
[secret]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[secrets]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[tokens]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/tokens/
[sensu-plus]: https://sensu.io/features/analytics
<!-- [{{dashboard-link}}]: # -->
[sensu-plugins-cassandra-bonsai]: https://bonsai.sensu.io/assets/sensu-plugins/sensu-plugins-cassandra
[sensu-plugins-cassandra-github]: https://github.com/sensu-plugins/sensu-plugins-cassandra
[sensu-ruby-runtime-bonsai]: https://bonsai.sensu.io/assets/sensu/sensu-ruby-runtime
[sensu-ruby-runtime-github]: https://github.com/sensu/sensu-ruby-runtime