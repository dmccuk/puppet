require 'spec_helper'
describe 'phpsysinfo' do

  context 'with defaults for all parameters' do
    it { should contain_class('phpsysinfo') }
  end
end
