require 'spec_helper'
describe 'auto' do

  context 'with defaults for all parameters' do
    it { should contain_class('auto') }
  end
end
