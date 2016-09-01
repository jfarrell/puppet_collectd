# common code for the 3rd party plugins
#
define collectd::plugin (
  $config_file_name,
  $config_template,
  $manage_package = true,
  $package_name = undef,
  $package_version = present,
  $modules = undef
){
  validate_string($config_file_name)
  validate_string($config_template)

  if $modules {
    validate_hash($modules)
  }

  if $manage_package {
    unless $package_name  {
      $package_name = $name
    }

    collectd::check_and_install_package { "${package_name} for ${name} plugin":
      package_name    => $package_name,
      package_version => $package_version,
      before          => File["load ${config_file_name} plugin config"]
    }
  }

  file { "load ${config_file_name} plugin config":
    ensure  => present,
    path    => "${collectd::params::plugin_config_dir}/${config_file_name}",
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template($config_template),
    notify  => Service['collectd'],
    require => Class['collectd::config']
  }
}
