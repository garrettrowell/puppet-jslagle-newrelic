require 'spec_helper'

describe 'newrelic' do
  let(:title) { 'newrelic' }

  ['RedHat'].each do |osfamily|
    describe "newrelic class without any parameters on #{osfamily}" do
      let(:params) {{ :license_key => '0000000000' }}
      let(:facts) { { :osfamily => osfamily } }

      it { should create_class('newrelic') }
      it { should create_file('newrelic-dir').with(
        :ensure => 'directory',
        :path => '/opt/newrelic' ) }
      it { should create_file('newrelic-config').with(
        :ensure => 'present',
        :path => '/opt/newrelic/newrelic/newrelic.yml',
        :content => /license_key: 0000000000/
      ) }
    end
  end
end
