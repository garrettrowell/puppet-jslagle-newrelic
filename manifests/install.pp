# == Class newrelic::intall
# This class is meant to be called from newrelic
# It install requires packages
class newrelic::install {

  $source = $newrelic::java_agent_source
  $version = $newrelic::java_agent_version
  $install = $newrelic::java_agent_install
  $file = $newrelic::java_agent_file
  $manage_unzip_package = $newrelic::manage_unzip_package

  Exec {
    path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ]
  }

  file { 'newrelic-dir':
    ensure => "directory",
    owner  => "root",
    group  => "root",
    mode   => "0755",
    path   => $install,
  }

  exec { 'download-newrelic':
    command => "wget ${source}/${version}/${file}",
    cwd     => $install,
    creates => "${install}/${file}",
    notify  => Exec['unzip-newrelic'],
  }

  if $manage_unzip_package {
    package { 'unzip':
      ensure => installed,
      before => Exec['unzip-newrelic'],
    }
  }

  exec { 'unzip-newrelic':
    command     => "unzip -o ${file}",
    cwd         => $install,
    refreshonly => true,
  }

}
