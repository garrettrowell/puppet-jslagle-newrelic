# == Class: newrelic
#
# Install newrelic app
#
# === Parameters
#
# Document parameters here.
#
# === Authors
#
# Jason Slagle <jason@cnwr.com>
#
# === Copyright
#
# Copyright 2013 Jason Slagle
#
class newrelic (
  $java_agent_version = $newrelic::params::java_agent_version,
  $java_agent_source  = $newrelic::params::java_agent_source,
  $java_agent_install = $newrelic::params::java_agent_install,
  $license_key        = $newrelic::params::license_key,
  $appname            = $newrelic::params::appname,
  $autotransname      = $newrelic::params::autotransname,
  $java_agent_file    = $newrelic::params::java_agent_file,
  $agent_enabled      = $newrelic::params::agent_enabled,
) inherits newrelic::params {

  include stdlib

  validate_string($java_agent_version)
  validate_string($java_agent_source)
  validate_string($java_agent_install)
  validate_string($license_key)
  validate_string($appname)
  validate_string($autotransname)
  validate_string($java_agent_file)
  validate_string($agent_enabled)

  anchor { "newrelic::begin": } ->
  class {"newrelic::install": } ->
  class {"newrelic::config": } ~>
  anchor { "newrelic::end": }
}
