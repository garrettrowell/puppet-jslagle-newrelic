# == Class newrelic::params
# This class is meant to be called from newrelic
# It set variable according to platform
class newrelic::params {
  $java_agent_version = '3.0.1'
  $java_agent_source  = 'http://download.newrelic.com/newrelic/java-agent/newrelic-agent/'
  $java_agent_file    = "newrelic-java-${java_agent_version}.zip"
  $java_agent_install = '/opt/newrelic'
  $license_key        = undef
  $appname            = 'My Application'
  $autotransname      = 'true'
  $template           = 'newrelic/newrelic.yml.erb'
}
