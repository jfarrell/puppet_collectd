class collectd::plugins::varnish (
  $modules,
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugin { 'varnish':
    package_name     => 'collectd-varnish',
    config_file_name => '10-varnish.conf',
    config_template  => 'collectd/plugins/varnish/10-varnish.conf.erb',
    modules          => $modules,
  }
}
