class collectd::plugins::apache (
  $modules,
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugin { 'apache':
    package_name     => 'collectd-apache',
    config_file_name => '10-apache.conf',
    config_template  => 'collectd/plugins/apache/10-apache.conf.erb',
    modules          => $modules,
  }
}
