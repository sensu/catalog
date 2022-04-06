## Overview

The Splunk Events integration provides a event processing pipeline for sending Sensu Events to Splunk as log data using a [Splunk TCP input][splunk-network-input].

This integration includes the following resources:

* `splunk-events` [pipeline]
* `splunk-events` [handler]

## Dashboards

This integration makes Sensu Event data available for searching and graphing in Splunk.

## Setup

<!-- Sensu Integration setup instructions, including Sensu agent configuration and external component configuration -->
<!-- EXAMPLE: what configuration (if any) is required in a third-party service to enable monitoring? -->

1. Configure Splunk or a Splunk Universal Forwarder [network input][splunk-network-input] for sensu events.

   Example `inputs.conf` file contents:

   Accept connections from any host on port `9998`:

   ```
   [tcp://9998]
   disabled = 0
   queue = parsingQueue
   sourcetype = sensu
   ```

   Accept connections from a specific host (e.g. `sensu-backend`) on port `9998`:

   ```
   [tcp://sensu-backend:9998]
   disabled: 0
   queue = parsingQueue
   sourcetype: sensu
   ```

   Example `props.conf` file contents:

   ```
   [default]
   TRUNCATE = 50000

   [sensu]
   TRUNCATE = 50000
   ```

   See the [Splunk `inputs.conf` reference documentation][splunk-tcp-input] and [Splunk `props.conf` reference documentation][splunk-props-conf] for more information.

2. Optionally configure the Splunk Universal Forwarder to forward events to the Splunk indexer.

   Example `outputs.conf` file contents:

   ```
   [tcpout]
   defaultGroup=sensu_events
   maxQueueSize=104857600

   [tcpout:sensu_events]
   server=splunk:9997
   maxQueueSize=104857600

   [tcpout-server://splunk:9997]
   ```

   See the [Splunk `outputs.conf` reference documentation][splunk-outputs-conf] for more information.

## Plugins

This integration uses Sensu's built-in TCP handler to process Sensu events. No external plugins are required.

## Metrics & Events

This integration does not produce any [metrics].

## Alerts

This integration does not produce any events that should be processed by an alert or incident management [pipeline].

## Reference Documentation

<!-- Please provide links to any relevant reference documentation to help users learn more and/or troubleshoot this integration; specifically including any third-party software documentation. -->

1. This integration uses [Handler Templating][handler-templating] for variable substitution.
2. Splunk Documentation: [Get data from TCP and UDP ports][splunk-network-input]
3. Splunk Documentation: [inputs.conf TCP input reference][splunk-tcp-input]
4. Splunk Documentation: [Configuration file directories][splunk-confdirs]

<!-- Links -->
[check]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/checks/
[asset]: https://docs.sensu.io/sensu-go/latest/plugins/assets/
[subscription]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/subscriptions/
[subscriptions]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/subscriptions/
[agents]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/
[annotation]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/#general-configuration-flags
[plugins]: https://docs.sensu.io/sensu-go/latest/plugins/
[metrics]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/metrics/
[pipeline]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/pipelines/
[handler]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/handlers/
[secret]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[secrets]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[tokens]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/tokens/
[handler-templating]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/handler-templates/
[sensu-plus]: https://sensu.io/features/analytics
[splunk-network-input]: https://docs.splunk.com/Documentation/Splunk/latest/Data/Monitornetworkports
[splunk-tcp-input]: https://docs.splunk.com/Documentation/Splunk/latest/Admin/Inputsconf#TCP:
[splunk-confdirs]: https://docs.splunk.com/Documentation/Splunk/latest/Admin/Configurationfiledirectories
[splunk-props-conf]: https://docs.splunk.com/Documentation/Splunk/latest/Admin/Propsconf
[splunk-outputs-conf]: https://docs.splunk.com/Documentation/Splunk/latest/Admin/Outputsconf
