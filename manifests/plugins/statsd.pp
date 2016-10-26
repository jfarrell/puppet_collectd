class collectd::plugins::statsd (
  $modules,
  $filter_metrics = false,
  $filter_metric_rules = {},
  $plugin_template = 'collectd/plugins/statsd/20-statsd.conf.erb',
  $package_name = 'collectd-statsd',
  $package_ensure = present,
  $package_required = ($::osfamily == 'RedHat')
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugins::plugin_common { 'statsd':
    package_name     => $package_name,
    package_ensure   => $package_ensure,
    package_required => $package_required,
    plugin_file_name => '20-statsd.conf',
    plugin_template  => $plugin_template,
  }
}
