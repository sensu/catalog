## Overview

The `cassandra-metrics` integration provides a Sensu check that uses Apache Cassandra's `nodetool` to collect metrics in Graphite format.

This integration includes the following resources:

* `metrics-cassandra-graphite` [check]
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

It's also possible to edit the [check] definition, to add the `--cfstats` command-line option. This will allow you to get detailed metrics on keyspaces and column families. Use `--filter REGEX` option to only output metrics for column-families matching the regex.

For more information, please read the [plugin documentation](sensu-plugins-cassandra-github).

## Plugins

* [sensu/sensu-plugins-cassandra][sensu-plugins-cassandra-bonsai] ([GitHub][sensu-plugins-cassandra-github])
* [sensu/sensu-ruby-runtime][sensu-ruby-runtime-bonsai] ([GitHub][sensu-ruby-runtime-github])

## Metrics & Events

This integration collects the following [metrics] (in [Graphite format][graphite-format]):

**Info Metrics:**

* `host.cassandra.exceptions`
* `host.cassandra.load`
* `host.cassandra.uptime`
* `host.cassandra.heap.used`
* `host.cassandra.heap.total`
* `host.cassandra.key_cache.capacity`
* `host.cassandra.key_cache.size`
* `host.cassandra.key_cache.hits`
* `host.cassandra.key_cache.requests`
* `host.cassandra.key_cache.hit_rate`
* `host.cassandra.row_cache.size`
* `host.cassandra.row_cache.capacity`
* `host.cassandra.row_cache.hits`
* `host.cassandra.row_cache.requests`
* `host.cassandra.row_cache.hit_rate`

**Thread Pool Metrics:**

* `host.cassandra.threadpool.ReadStage.active`
* `host.cassandra.threadpool.ReadStage.pending`
* `host.cassandra.threadpool.ReadStage.completed`
* `host.cassandra.threadpool.ReadStage.blocked`
* `host.cassandra.threadpool.RequestResponseStage.active`
* `host.cassandra.threadpool.RequestResponseStage.pending`
* `host.cassandra.threadpool.RequestResponseStage.completed`
* `host.cassandra.threadpool.RequestResponseStage.blocked`
* `host.cassandra.threadpool.MutationStage.active`
* `host.cassandra.threadpool.MutationStage.pending`
* `host.cassandra.threadpool.MutationStage.completed`
* `host.cassandra.threadpool.MutationStage.blocked`
* `host.cassandra.threadpool.ReadRepairStage.active`
* `host.cassandra.threadpool.ReadRepairStage.pending`
* `host.cassandra.threadpool.ReadRepairStage.completed`
* `host.cassandra.threadpool.ReadRepairStage.blocked`
* `host.cassandra.threadpool.ReplicateOnWriteStage.active`
* `host.cassandra.threadpool.ReplicateOnWriteStage.pending`
* `host.cassandra.threadpool.ReplicateOnWriteStage.completed`
* `host.cassandra.threadpool.ReplicateOnWriteStage.blocked`
* `host.cassandra.threadpool.GossipStage.active`
* `host.cassandra.threadpool.GossipStage.pending`
* `host.cassandra.threadpool.GossipStage.completed`
* `host.cassandra.threadpool.GossipStage.blocked`
* `host.cassandra.threadpool.AntiEntropyStage.active`
* `host.cassandra.threadpool.AntiEntropyStage.pending`
* `host.cassandra.threadpool.AntiEntropyStage.completed`
* `host.cassandra.threadpool.AntiEntropyStage.blocked`
* `host.cassandra.threadpool.MigrationStage.active`
* `host.cassandra.threadpool.MigrationStage.pending`
* `host.cassandra.threadpool.MigrationStage.completed`
* `host.cassandra.threadpool.MigrationStage.blocked`
* `host.cassandra.threadpool.MemtablePostFlusher.active`
* `host.cassandra.threadpool.MemtablePostFlusher.pending`
* `host.cassandra.threadpool.MemtablePostFlusher.completed`
* `host.cassandra.threadpool.MemtablePostFlusher.blocked`
* `host.cassandra.threadpool.StreamStage.active`
* `host.cassandra.threadpool.StreamStage.pending`
* `host.cassandra.threadpool.StreamStage.completed`
* `host.cassandra.threadpool.StreamStage.blocked`
* `host.cassandra.threadpool.FlushWriter.active`
* `host.cassandra.threadpool.FlushWriter.pending`
* `host.cassandra.threadpool.FlushWriter.completed`
* `host.cassandra.threadpool.FlushWriter.blocked`
* `host.cassandra.threadpool.MiscStage.active`
* `host.cassandra.threadpool.MiscStage.pending`
* `host.cassandra.threadpool.MiscStage.completed`
* `host.cassandra.threadpool.MiscStage.blocked`
* `host.cassandra.threadpool.InternalResponseStage.active`
* `host.cassandra.threadpool.InternalResponseStage.pending`
* `host.cassandra.threadpool.InternalResponseStage.completed`
* `host.cassandra.threadpool.InternalResponseStage.blocked`
* `host.cassandra.threadpool.HintedHandoff.active`
* `host.cassandra.threadpool.HintedHandoff.pending`
* `host.cassandra.threadpool.HintedHandoff.completed`
* `host.cassandra.threadpool.HintedHandoff.blocked`
* `host.cassandra.message_type.RANGE_SLICE.dropped`
* `host.cassandra.message_type.READ_REPAIR.dropped`
* `host.cassandra.message_type.BINARY.dropped`
* `host.cassandra.message_type.READ.dropped`
* `host.cassandra.message_type.MUTATION.dropped`
* `host.cassandra.message_type.REQUEST_RESPONSE.dropped`

## Reference Documentation

1. This integration uses [Sensu Tokens][tokens] for variable substitution.
2. Apache Cassandra Docs: [`nodetool info` command](https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/tools/toolsInfo.html)
3. Apache Cassandra Docs: [`nodetool tpstats` command](https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/tools/toolsTPstats.html)
4. Apache Cassandra Docs: [`nodetool cfstats` command](https://docs.datastax.com/en/cassandra-oss/2.1/cassandra/tools/toolsCFstats.html)


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
[graphite-format]: https://graphite.readthedocs.io/en/latest/feeding-carbon.html#the-plaintext-protocol