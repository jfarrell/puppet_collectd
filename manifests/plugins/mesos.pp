class collectd::plugins::mesos (
  $modules,
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugin { 'mesos':
    package_name     => 'collectd-mesos',
    config_file_name => '10-mesos-master.conf',
    config_template  => 'collectd/plugins/mesos/10-mesos-master.conf.erb',
    modules          => $modules,
  }
}
