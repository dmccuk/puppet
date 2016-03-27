require 'spec_helper'
describe 'profile_sysinfo' do

  context 'with defaults for all parameters' do
    it { should contain_class('profile_sysinfo') }
  end
end
