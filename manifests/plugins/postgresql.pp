class collectd::plugins::postgresql (
  $modules,
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugin { 'postgresql':
    package_name     => 'collectd-postgresql',
    config_file_name => '10-postgresql.conf',
    config_template  => 'collectd/plugins/postgresql/10-postgresql.conf.erb',
    modules          => $modules,
  }
}
