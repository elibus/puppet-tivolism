require 'spec_helper'

describe 'tivolism' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "tivolism class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('tivolism::params') }
        it { should contain_class('tivolism::install').that_comes_before('tivolism::config') }
        it { should contain_class('tivolism::config') }
        it { should contain_class('tivolism::service').that_subscribes_to('tivolism::config') }

        it { should contain_service('tivolism') }
        it { should contain_package('tivolism').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'tivolism class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('tivolism') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
