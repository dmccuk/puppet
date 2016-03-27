require 'spec_helper'
describe 'cis' do

  context 'with defaults for all parameters' do
    it { should contain_class('cis') }
  end
end
