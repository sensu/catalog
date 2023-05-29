## Overview

<!-- Sensu Integration description; supports markdown -->

The ServiceNow CMDB Registration integration automatically registers Sensu entities as ServiceNow configuration management database (CMDB) Configuration Items (CIs).

This integration is compatible with ServiceNow versions **Rome and older**.

<!-- Provide a high level overview of the integration contents (e.g. checks, filters, mutators, handlers, assets, etc) -->

This integration includes the following Sensu resources:

* `servicenow-cmdb` [handler]
* `discovery-only` [filter]
* `servicenow-cmdb` [pipeline]
* `sensu/sensu-servicenow-handler:3.0.2` [asset]

## Dashboards

<!-- List of compatible dashboards w/ screenshots (supports png, jpeg, and gif images; relative paths only; e.g. `![](img/dashboard-1.png)` )-->

The ServiceNow CMDB Registration integration is compatible with ServiceNow CMDB dashboards.

![](img/cmdb-dashboard.png)

## Setup

<!-- Sensu Integration setup instructions, including Sensu agent configuration and external component configuration -->
<!-- EXAMPLE: what configuration (if any) is required in a third-party service to enable monitoring? -->

1. Get the ServiceNow instance's base URL (e.g. https://mycompany.service-now.com), username, and password.

   **Optional**: If you want to use Sensu [secrets] to represent the ServiceNow username and password, you will need the secret names when you install this integration.

1. If your organization has a customized ServiceNow instance, get the following configuration information:

    - Name of the ServiceNow CMDB table to use for managing CIs
    - Field name that Sensu should use to look up CIs (the CMDB key)
    - [Handler templates][handler-templating] for CI and asset tag naming
    - Custom CI properties to populate from Sensu entity [annotations]

    **NOTE**: If you are using an unmodified ServiceNow instance, the installation steps for this integration include default configuration details. You do not need custom configuration to use this integration.

1. Enable ServiceNow CMDB registration by specifying an agent keepalive handler or a check pipeline reference.

   <details><summary><strong>Example: Agent keepalive handler configuration</strong></summary>

   To enable ServiceNow CMDB registration for all entities, list the `servicenow-cmdb` handler as a value for the [keepalive-handlers] agent configuration option in the `agent.yml` configuration file:

   ```yaml
   keepalive-handlers:
     - servicenow-cmdb
   ```

   **NOTE**: You must [restart] the Sensu agent for the keepalive handler configuration to take effect.

   </details>
   <br>
   
   <details><summary><strong>Example: Check pipeline reference configuration</strong></summary>

   To enable ServiceNow CMDB registration only for entities that execute a specific check, add the `servicenow-cmdb` [pipeline] to the check definition.

   ```yaml
   spec:
     pipelines:
       - api_version: core/v2
         type: Pipeline
         name: servicenow-cmdb
   ```

   </details>
   <br>

1. **Optional** Specify custom ServiceNow CMDB configuration on a per-entity or per-check basis.

   <details><summary><strong>Example: Custom CMDB table and asset tag configuration</strong></summary>

   The ServiceNow CMDB Registration integration uses the configuration parameters you specify during installation. To override the installed configuration for a single entity or check, add [annotations] with the prefix `servicenow/config/` to the `agent.yml` configuration file or the check definition.

   ```yaml
   annotations:
     servicenow/config/cmdb-table: "cmdb_ci"
     servicenow/config/cmdb-asset-tag: "aws/us-west-2/instances/i-424242"
   ```

   For a complete list of available annotations, read the [sensu/sensu-servicenow-handler annotations documentation].

   </details>
   <br>

1. **Optional** Configure custom ServiceNow CMDB CI properties.

   <details><summary><strong>Example: Custom ServiceNow CMDB CI property configuration</strong></summary>

   The ServiceNow CMDB Registration integration supports ServiceNow CMDB tables with custom fields.

   When you install this integration, you can list custom CI properties to populate from Sensu entity [annotations] with the prefix `servicenow/table/cmdb/`. If an entity includes a matching annotation, Sensu will populate the corresponding field in the ServiceNow CMDB table with the annotation's value.

   For example, if you list the `asset_tag` and `store_id` custom CI properties when you install this integration, Sensu will check entities for matching annotations.

   Set the entity annotations in the `agent.yml` configuration file:

   ```yaml
   annotations:
     servicenow/table/cmdb/asset_tag: "i-424242"
     servicenow/table/cmdb/store_id: "1234"
   ```

   To add custom CI properties after installing this integration, update the `servicenow-cmdb` handler command to list the additional properties in the `--cmdb-properties` flag values:

   ```yaml
   command: >-
    sensu-servicenow-handler --cmdb-registration --cmdb-table cmdb_ci --cmdb-key name --cmdb-name "{{ .Entity.Name }}" --cmdb-asset-tag "sensu/{{ .Entity.Namespace }}/{{ .Entity.Name }}" --cmdb-properties "asset_tag,store_id,category,location"
   ```

   </details>
   <br>

## Plugins

<!-- Links to any Sensu Integration dependencies (i.e. Sensu Plugins) -->

The ServiceNow CMDB Registration integration uses the following Sensu [plugins]:

- [sensu/sensu-servicenow-handler][sensu-servicenow-handler-bonsai]

## Alerts

<!-- List of all alerts generated by this integration. -->

<!-- This integration provides an alert & incident management processing pipeline for use with other monitoring integrations. By default this integration will process all events passing the [built-in `is_incident` filter][is_incident] (i.e. failing events and resolution events only). Event processing via this integration may be suppressed using [Sensu Silencing][silences] (see the [built-in `not_silenced` filter][not_silenced] for more details). -->

The ServiceNow CMDB Registration integration does not produce any events that should be processed by an alert or incident management [pipeline].

## Metrics

<!-- List of all metrics or events collected by this integration. -->

The ServiceNow CMDB Registration integration does not produce any [metrics].

## Reference Documentation

<!-- Please provide links to any relevant reference documentation to help users learn more and/or troubleshoot this integration; specifically including any third-party software documentation. -->

* [Handler templating][handler-templating] (Sensu documentation): the ServiceNow CMDB Registration integration supports handler templating for variable substitution with data from Sensu events
* [Configuration Management Database][servicenow-cmdb] (ServiceNow documentation)


<!-- Links -->
[check]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/checks/
[asset]: https://docs.sensu.io/sensu-go/latest/plugins/assets/
[subscription]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/subscriptions/
[subscriptions]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/subscriptions/
[agents]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/
[annotation]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/#agent-annotations
[annotations]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/#agent-annotations
[plugins]: https://docs.sensu.io/sensu-go/latest/plugins/
[metrics]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/metrics/
[pipeline]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/pipelines/
[handler]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/handlers/
[filter]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-filter/filters/
[filters]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-filter/filters/
[secret]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[secrets]: https://docs.sensu.io/sensu-go/latest/operations/manage-secrets/secrets/
[tokens]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/tokens/
[handler-templating]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/handler-templates/
[sensu-plus]: https://sensu.io/features/analytics
[sensu-servicenow-handler-bonsai]: https://bonsai.sensu.io/assets/sensu/sensu-servicenow-handler
[servicenow-cmdb]: https://docs.servicenow.com/bundle/rome-servicenow-platform/page/product/configuration-management/concept/c_ITILConfigurationManagement.html
[restart]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/#restart-the-service
[keepalive-handlers]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/#keepalive-handlers-option
[sensu/sensu-servicenow-handler annotations documentation]: https://bonsai.sensu.io/assets/sensu/sensu-servicenow-handler#annotations
