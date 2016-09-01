class collectd::plugins::zookeeper (
  $modules,
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugin { 'zookeeper':
    package_name     => 'collectd-zookeeper',
    config_file_name => '20-zookeeper.conf',
    config_template  => 'collectd/plugins/zookeeper/20-zookeeper.conf.erb',
    modules          => $modules,
  }
}
