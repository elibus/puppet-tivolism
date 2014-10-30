require 'spec_helper'

describe 'tivolism' do
  context 'supported operating systems' do
    ['RedHat'].each do |osfamily|
      describe "tivolism class without any parameters on #{osfamily}" do
        let(:params) {{
          :tcpserveraddress    => '10.0.0.1',
          :inclexcl            => '/path/to/my/inclexcl.file'
        }}
        let(:facts) {{
          :osfamily       => osfamily,
          :concat_basedir => '/dne'
        }}

        it { should compile.with_all_deps }

        it { should contain_class('tivolism::params') }
        it { should contain_class('tivolism::install').that_comes_before('tivolism::config') }
        it { should contain_class('tivolism::config') }
        it { should contain_class('tivolism::service').that_subscribes_to('tivolism::config') }

        it { should contain_service('dsmcad') }
        it { should contain_package('TIVsm-BA').with_ensure('present') }
        it { should contain_package('TIVsm-API64').with_ensure('present') }
        it { should contain_package('compat-libstdc++-33.i686').with_ensure('present') }
        it { should contain_package('compat-libstdc++-33.x86_64').with_ensure('present') }
        it { should contain_package('libstdc++.i686').with_ensure('present') }
        it { should contain_package('libstdc++.x86_64').with_ensure('present') }

        it { should contain_file('/opt/tivoli/tsm/client/ba/bin/dsm.opt').with_ensure('file') }
        it { should contain_file('/opt/tivoli/tsm/client/ba/bin/dsm.sys') }
        it { should contain_concat('/opt/tivoli/tsm/client/ba/bin/dsm.sys').with_ensure('present') }

        it { should contain_concat__fragment('dms.sys default') }
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
