require 'spec_helper'
describe 'profile_base' do

  context 'with defaults for all parameters' do
    it { should contain_class('profile_base') }
  end
end
