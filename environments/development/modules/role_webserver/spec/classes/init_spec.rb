require 'spec_helper'
describe 'role_webserver' do

  context 'with defaults for all parameters' do
    it { should contain_class('role_webserver') }
  end
end
