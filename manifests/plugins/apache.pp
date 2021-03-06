class collectd::plugins::apache (
  $instances,
  $filter_metrics = false,
  $filter_metric_rules = {} ) {
  validate_hash($instances)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugins::plugin_common { 'apache':
    package_name         => 'collectd-apache',
    plugin_file_name     => '10-apache.conf',
    plugin_template_name => 'apache/10-apache.conf.erb',
  }
}
