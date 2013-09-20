# == Class newrelic::config
# This class is meant to be called from newrelic
# it bakes the configuration file
class newrelic::config {

  $appname = $newrelic::appname
  $license_key = $newrelic::license_key
  $autonametrans = $newrelic::authnametrans
  $install = $newrelic::java_agent_install

  file { 'newrelic-config':
    ensure  => present,
    mode    => '0644',
    path    => "${install}/newrelic/newrelic.yml",
    content => template('newrelic/newrelic.yml.erb'),
  }
}

