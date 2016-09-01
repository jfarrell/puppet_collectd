class collectd::plugins::nginx (
  $modules,
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugin { 'nginx':
    package_name     => 'collectd-nginx',
    config_file_name => '10-nginx.conf',
    config_template  => 'collectd/plugins/nginx/10-nginx.conf.erb',
    modules          => $modules,
  }
}
