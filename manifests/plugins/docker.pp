class collectd::plugins::docker (
  $modules,
  $db_template = 'collectd/plugins/docker/dockerplugin.db.erb',
) {
  validate_hash($modules)
  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  include collectd

  file { ['/usr/share/', '/usr/share/collectd/', '/usr/share/collectd/docker-collectd-plugin/']:
    ensure  => directory,
    owner   => root,
    group   => 'root',
    mode    => '0755',
    before  => File['get dockerplugin.py'],
    require => Exec['install dependencies']
  }

  file { 'get dockerplugin.db':
    ensure  => present,
    replace => 'yes',
    path    => '/usr/share/collectd/docker-collectd-plugin/dockerplugin.db',
    owner   => root,
    group   => 'root',
    mode    => '0755',
    content => template($db_template),
  }

  collectd::plugin { 'docker':
    package_name     => 'collectd-docker',
    config_file_name => '10-docker.conf',
    config_template  => 'collectd/plugins/docker/10-docker.conf.erb',
    modules          => $modules,
  }
}
