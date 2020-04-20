require 'spec_helper'

describe 'katello' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('katello::candlepin') }
      it { is_expected.to contain_class('katello::application') }
      it { is_expected.to contain_class('katello::pulp') }
      it { is_expected.to contain_class('katello::qpid_client') }
      it { is_expected.to contain_class('katello::qpid') }

      it { is_expected.to contain_package('tfm-rubygem-katello').that_requires('Class[candlepin]') }
    end
  end
end
