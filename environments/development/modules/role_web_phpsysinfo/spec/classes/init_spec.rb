require 'spec_helper'
describe 'role_web_phpsysinfo' do

  context 'with defaults for all parameters' do
    it { should contain_class('role_web_phpsysinfo') }
  end
end
