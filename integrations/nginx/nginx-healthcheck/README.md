## Description

Monitor NGINX health status using the [NGINX `stub_status` module][nginx_stub_status].

### Supported Dashboards

This integration is compatible with the [Sumo Logic NGINX app][sumologic-nginx-app] (included w/ [Sensu Plus][sensu-plus]).

![](img/nginx-ulm-overview.png)

## Setup

1. Add the "nginx" subscription to agents that should run this check.

   **NOTE:** set the optional `check_nginx_status_url` agent annotation to override the default URL (`http://localhost:80/nginx_status`).

2. Ensure the [NGINX `stub_status` module][nginx_stub_status] is enabled on the NGINX instances(s) to be monitored.

   **NOTE:** the following example NGINX configuration snippet shows how to enable the `stub_status` module:

   ```
   # NGINX Status Module
   location /nginx_status {
       stub_status;
       allow 0.0.0.0;
   }
   ```

3. More configuration options are available for this plugin; please see the related plugin documentation for more details.

## Plugins

- [sensu-plugins/sensu-plugins-nginx:3.1.2][sensu-plugins-nginx]
- [sensu/sensu-ruby-runtime:0.0.10][sensu-ruby-runtime]

[sumologic-nginx-app]: https://www.sumologic.com/application/nginx/
[sensu-plus]: https://sensu.io/features/analytics
[nginx_stub_status]: https://nginx.org/en/docs/http/ngx_http_stub_status_module.html
[sensu-plugins-nginx]: https://bonsai.sensu.io/assets/sensu-plugins/sensu-plugins-nginx
[sensu-ruby-runtime]: https://bonsai.sensu.io/assets/sensu/sensu-ruby-runtime
