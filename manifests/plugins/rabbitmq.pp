class collectd::plugins::rabbitmq (
  $modules,
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugin { 'rabbitmq':
    package_name     => 'collectd-rabbitmq',
    config_file_name => '10-rabbitmq.conf',
    config_template  => 'collectd/plugins/rabbitmq/rabbitmq.conf.erb',
    modules          => $modules,
  }
}
