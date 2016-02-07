require 'spec_helper'
describe 'role_basic' do

  context 'with defaults for all parameters' do
    it { should contain_class('role_basic') }
  end
end
