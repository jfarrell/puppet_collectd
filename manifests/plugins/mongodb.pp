class collectd::plugins::mongodb (
  $modules,
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugin { 'mongodb':
    package_name     => 'collectd-mongodb',
    config_file_name => '10-mongodb.conf',
    config_template  => 'collectd/plugins/mongodb/10-mongodb.conf.erb',
    modules          => $modules,
  }
}
