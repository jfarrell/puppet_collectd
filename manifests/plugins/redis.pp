class collectd::plugins::redis (
  $modules,
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugin { 'redis':
    package_name     => 'collectd-redis',
    config_file_name => '10-redis_master.conf',
    config_template  => 'collectd/plugins/redis/10-redis_master.conf.erb',
    modules          => $modules,
  }
}
