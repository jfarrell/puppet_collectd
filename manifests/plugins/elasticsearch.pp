class collectd::plugins::elasticsearch (
  $modules,
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  collectd::plugin { 'elasticsearch':
    package_name     => 'collectd-elasticsearch',
    config_file_name => '20-elasticsearch.conf',
    config_template  => 'collectd/plugins/elasticsearch/20-elasticsearch.conf.erb',
    modules          => $modules,
  }
}
