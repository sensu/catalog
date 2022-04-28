{{% section integration_purpose %}}

## Purpose

<!-- Sensu Integration description; supports markdown -->

Cross-platform host monitoring for Linux, Windows, and MacOS systems.
Collect metrics and alerts on CPU, IO, load, memory, swap, and uptime.

{{% /section %}}

{{% section integration_resources %}}

## Integration resources

<!-- Provide a high level overview of the integration contents (e.g. checks, filters, mutators, handlers, assets, etc) -->

This integration provides the following resources:

* `system/system-check` [check]
* `sensu/system-check` [asset]

{{% /section %}}

{{% section supported_dashboards %}}

## Supported dashboards

<!-- List of supported dashboards w/ screenshots (supports png, jpeg, and gif images; relative paths only; e.g. `![](img/dashboard-1.png)` )-->

This integration is compatible with the [Sumo Logic "Host and Process Metrics" app][sumo-host-app], included w/ [Sensu Plus][sensu-plus].

![](img/host-metrics-overview.png)

This integration is compatible with the Sumo Logic "Sensu" app, included with [Sensu Plus][sensu-plus].

![](img/sensu-plus.gif)

{{% /section %}}

{{% section integration_dependencies %}}

## Dependencies

<!-- Links to any Sensu Integration dependencies (i.e. Sensu Plugins) -->

This integration does not require any [Plugins].

This plugin uses a [Sensu Token][tokens] for metric tag variable substitution (e.g. setting `entity` and `namespace` tags to the corresponding values for the Sensu Agent)

{{% /section %}}

{{% section integration_setup %}}

## Setup

<!-- Sensu Integration setup instructions, including Sensu agent configuration and external component configuration -->
<!-- EXAMPLE: what configuration (if any) is required in a third-party service to enable monitoring? -->

1. Add one of the following [subscriptions] to [agents] that should run this check:

  * `darwin`
  * `linux`
  * `windows`
  * `system`
  * `system/darwin`
  * `system/linux`
  * `system/windows`

1. Optionally set the `system_cpu_used_warning_threshold` agent [annotation] to override the default value (`80.0`%) on a per-host basis.

1. Optionally set the `system_cpu_used_critical_threshold` agent [annotation] to override the default value (`90.0`%) on a per-host basis.

1. Optionally set the `system_mem_used_warning_threshold` agent [annotation] to override the default value (`80.0`%) on a per-host basis.

1. Optionally set the `system_mem_used_critical_threshold` agent [annotation] to override the default value (`90.0`%) on a per-host basis.

{{% /section %}}

{{% section integration_metrics %}}

## Metrics

<!-- List of all metrics collected by this integration. -->

This integration collects the following [metrics]:

Metric name | Description | Tags
----------- | ----------- | ----
`system_cpu_cores` | Total number of CPU cores. | `entity`, `namespace`, `os`
`system_cpu_idle` | Percent of time all cpus were idle, per core. | `entity`, `namespace`, `os`, `cpu`
`system_cpu_used` | Percent of time all cpus were used, per core. | `entity`, `namespace`, `os`, `cpu`
`system_cpu_user` | Percent of time total cpu was used by normal processes in user mode, per core. | `entity`, `namespace`, `os`, `cpu`
`system_cpu_system` | Percent of time all cpus used by processes executed in kernel mode, per core. | `entity`, `namespace`, `os`, `cpu`
`system_cpu_nice` | Percent of time all cpus used by niced processes in user mode, per core. | `entity`, `namespace`, `os`, `cpu`
`system_cpu_iowait` | Percent of time all cpus waiting for I/O to complete, per core. | `entity`, `namespace`, `os`, `cpu`
`system_cpu_irq` | Percent of time all cpus servicing interrupts, per core. | `entity`, `namespace`, `os`, `cpu`
`system_cpu_sortirq` | Percent of time all cpus servicing software interrupts, per core. | `entity`, `namespace`, `os`, `cpu`
`system_cpu_stolen` | Percent of time all cpus serviced virtual hosts operating systems, per core. | `entity`, `namespace`, `os`, `cpu`
`system_cpu_guest` | Percent of time all cpus serviced guest operating system, per core. | `entity`, `namespace`, `os`, `cpu`
`system_cpu_guest_nice` | Percent of time all cpus serviced niced guest operating system, per core. | `entity`, `namespace`, `os`, `cpu`
`system_mem_used` | Percent of memory used. | `entity`, `namespace`, `os`
`system_mem_used_bytes` | Used memory in bytes. | `entity`, `namespace`, `os`
`system_mem_total_bytes` | Total memory in bytes. | `entity`, `namespace`, `os`
`system_swap_used` | Percent of swap used. | `entity`, `namespace`, `os`
`system_swap_used_bytes` | Used swap in bytes. | `entity`, `namespace`, `os`
`system_swap_total_bytes` | Total swap in bytes. | `entity`, `namespace`, `os`
`system_load_load1` | System load averaged over 1 minute, high load value dependant on number of cpus in system. | `entity`, `namespace`, `os`
`system_load_load5` | System load averaged over 5 minute, high load value dependent on number of cpus in system. | `entity`, `namespace`, `os`
`system_load_load15` | System load averaged over 15 minute, high load value dependent on number of cpus in system. | `entity`, `namespace`, `os`
`system_load_load1_per_cpu` | System load averaged over 1 minute normalized by cpu count, values > 1 means system may be overloaded. | `entity`, `namespace`, `os`
`system_load_load5_per_cpu` | System load averaged over 5 minute normalized by cpu count, values > 1 means system may be overloaded. | `entity`, `namespace`, `os`
`system_load_load15_per_cpu` | System load averaged over 15 minute normalized by cpu count, values > 1 means system may be overloaded. | `entity`, `namespace`, `os`
`system_host_uptime` | Host uptime in seconds. | `entity`, `namespace`, `os`

{{% /section %}}

{{% section integration_events %}}

## Events

<!-- List of all alerts generated by this integration. -->

This integration does not produce events.

{{% /section %}}

{{% section more_information %}}

## More information

<!-- Please provide links to any relevant reference documentation to help users learn more and/or troubleshoot this integration. -->

- Sumo Logic documentation: [Collect Metrics for Host and Processes][sumo-host-metrics]
- Sumo Logic blog post: [Host and process Metrics — monitoring beyond apps][sumo-host-app-blogpost]

{{% /section %}}

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
[tokens]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/tokens/
[sensu-plus]: https://sensu.io/features/analytics
[sumo-host-app]: https://www.sumologic.com/application/host-and-process-metrics/
[sumo-host-metrics]: https://help.sumologic.com/07Sumo-Logic-Apps/14Hosts_and_Operating_Systems/Host_and_Process_Metrics/Collect_Metrics_for_Host_and_Processes
[sumo-host-app-blogpost]: https://www.sumologic.com/blog/monitoring-host-process-metrics/
