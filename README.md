# Sensu Catalogs 

This repository contains [monitoring as code][mac] templates for enabling various
monitoring integrations (e.g. Linux system monitoring checks, or NGINX service 
health monitoring), and pipeline integrations (e.g. Pagerduty, Elasticsearch, 
Splunk, Ansible Tower). 

## Project Goals 

The goal of this project is to provide reference implementations for effective 
monitoring with Sensu Go. The Sensu Catalog should (eventually) provide 
everything a new Sensu user needs to get up and running and rapidly deploy 
across a large fleet of systems. Today there are already over 200 integration 
templates available including dozens of monitors for third-party services and 
integrations with various systems of record. 

## Integration Template Guidelines

### All templates

1. All integration templates _must_ be in YAML format, for consistency (and 
   comment support). All YAML files should use the `.yaml` file extension, 
   because we're picky that way. 

1. All integration templates _must_ begin with a comment describing the 
   general function and capabilities of the integration. 
   
1. All resource definitions _must not_ include a namespace. 

1. All templates will be validated via [super-linter][linter]. We recommend 
   [running it locally][linter-local] to streamline PR approval.

1. CheckConfig, HookConfig, Filter, Mutator, and Handler resource names _must_ 
   be unique within the scope of this project.

   _NOTE: at this time we do not wish to enforce strict naming conventions. We
   will resolve naming conflicts on a case-by-case basis, which means resource
   names will be subject to change._

### Check templates

1. Check templates resources _should_ be defined in the following order (by 
   resource type):

    * CheckConfig
    * HookConfig(s)
    * Secret(s)
    * Asset(s)

1. Check resources _must_ include the following required fields, even if they
   are blank or are configured with default settings:

    * `command`
    * `runtime_assets`
    * `publish` (i.e. `publish: true`)
    * `subscriptions`
    * `interval`
    * `timeout`
    * `ttl`
    
1. Check resources _must_ recommend one or more named subscriptions. At a
   minimum this should include the corresponding integrations sub-directory 
   as the default naming convention. For example, all PostgreSQL monitoring 
   templates should include the ["postgres"](tree/main/monitors/postgres) 
   subscription. Check resources may optionally include additional/alternate 
   subscription names (e.g. "pg" or "postgresql").

1. Most commands _should_ be wrapped using the YAML `>-` multiline "block 
   scalar" syntax.

    ```yaml
    spec:
      command: >-
        check-disk-usage.rb
        -w {{ .annotations.disk_usage_warning | default 85 }}
        -c {{ .annotations.disk_usage_critical | default 95 }}
    ```

1. As shown in the example above, check commands should include tunables
   using [Sensu tokens][tokens], preferably sourced from Entity annotations 
   with explicitly configured defaults.

1. Check resources _should_ use the "interval" scheduler, with a minimum 
   interval of `30` seconds.

1. Check timeout _should_ be set to a non-zero value and should not be greater
   than 50% of the interval.

1. Check definitions must specify the appropriate Handler from the
   [handler list](#handler-list) for its collected data.

### Pipeline templates

1. Handler template resources should be defined in the following order 
   (by resource type):

    * Handler
    * Secret(s)
    * Asset(s)

1. Handler resources _must_ include the following required fields, even if they
   are blank or are configured with default settings:
   
   Pipe handlers: 
   
    * `type`
    * `api_version`
    * `name`
    * `command`
    * `filters`
    * `runtime_assets`
    * `timeout`
    * `env_vars`
    * `secrets`
   
   Socket handlers: 
   
    * `type`
    * `api_version`
    * `name`
    * `socket`
    * `filters`
    * `timeout`

1. Take care to maintain secrets. If a resource makes use of a secret and the
   command supports using built-in enviornment variables for that secret,
   avoid exposing it unnecessarily with a command argument.  For example,
   the InfluxDB handler has arguments for providing a username (-u) and password 
   (-p). It also supports specifying those as the environment variables 
   `INFLUXDB_USER` and `INFLUXDB_PASSWORD`, respectively. In this case the 
   command should avoid using the arguments and instead use the environment 
   variables.

1. Secrets should be created using the built-in `env` provider.

1. For alert and incident-management handlers avoid the use of filters that
   have highly subjective configuration options. By default, use the
   `is_incident` and `not_silenced` filters. However, we do encourage you
   to share your filters, as appropriate in the `shared` directory.

### Filter templates 

1. Filter templates should be created in the `shared` directory.

1. Filter template resources should be defined in the following order (by 
   resource type): 

    * Filter 
    * Asset(s)

1. Filter resources _must_ include the following required fields, even if they
   are blank or are configured with default settings:

    * `action`
    * `expressions`
    * `runtime_assets`

### Mutator resources 

1. Mutator templates should be created in the `shared` directory.

1. Mutator template resources should be defined in the following order (by 
   resource type): 

    * Mutator
    * Secret(s)
    * Asset(s)

1. Mutator resources _must_ include the following required fields, even if they
   are blank or are configured with default settings:

    * `command`
    * `timeout`
    * `env_vars`
    * `secrets`
    * `runtime_assets`

### Asset resources 
   
1. Asset resources _must_ include a version reference in their resource name. 
   For example: `sensu-plugins/sensu-plugins-disk-checks:5.0.1`.
   
1. Asset resources _should_ include an organization or author the resource 
   name. For example, the official Sensu Pagerduty integration project hosted 
   in the "sensu" organization on GitHub ([sensu/sensu-pagerduty-handler][0]),
   and published to under the "sensu" organization on Bonsai 
   ([sensu/sensu-pagerduty-handler][1]) should be named: 
   `sensu/sensu-pagerduty-handler:2.1.0`
   
1. All [Sensu Assets][assets] resources must refer to assets hosted on 
   [Bonsai][bonsai].

## Contributing

There are three ways to contribute to this project: 

1. **Use the integration templates provided in this catalog and share your
   feedback.** 
   
1. **Contribute "feature requests" to indicate interest in adding new 
   integration templates.**
   
1. **Contribute integration templates and/or modifications to existing
   templates.**
   
How to do it: 

- Integration feedback in the form of GitHub issues with titles like "Ansible 
  Tower integration feedback" are welcome! Comments telling us what did 🙌 or 
  didn't 🤔 work for you and/or any suggestions you might have are very 
  helpful!
  
- Feature requests in the form of GitHub issues with titles like "Add support 
  for X" are welcome! If such an issue already exists, a simple comment with 
  a 👍 or 💯 emoji on an existing issue actually motivates us quite a bit more
  than you might think! 
  
- **Pull requests are not only appreciated, they will be rewarded with [FREE 
  SWAG][rewards]!** PRs that expose an implicit default configuration settings,
  or improve an integration template's code comments (documentation) will 
  always be accepted. PRs that provide alternative configurations are also 
  **always welcome**.
  
Thanks in advance for your contributions! 


[mac]: #monitoring-as-code
[rewards]: https://sensu.io/contributor-rewards 
[bonsai]: https://bonsai.sensu.io 
[assets]: https://docs.sensu.io/sensu-go/latest/plugins/assets/ 
[tokens]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/tokens/ 
[linter]: https://github.com/github/super-linter/
[linter-local]: https://github.com/github/super-linter/blob/master/docs/run-linter-locally.md

[0]: https://github.com/sensu/sensu-pagerduty-handler 
[1]: https://bonsai.sensu.io/assets/sensu/sensu-pagerduty-handler 