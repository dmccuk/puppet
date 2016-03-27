require 'spec_helper'
describe 'adauth' do

  context 'with defaults for all parameters' do
    it { should contain_class('adauth') }
  end
end
