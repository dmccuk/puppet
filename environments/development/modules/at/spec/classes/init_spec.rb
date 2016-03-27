require 'spec_helper'
describe 'at' do

  context 'with defaults for all parameters' do
    it { should contain_class('at') }
  end
end
