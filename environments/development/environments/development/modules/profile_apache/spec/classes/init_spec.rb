require 'spec_helper'
describe 'profile_apache' do

  context 'with defaults for all parameters' do
    it { should contain_class('profile_apache') }
  end
end
