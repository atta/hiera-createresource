require 'spec_helper'
describe 'hiera_createresource' do

  context 'with defaults for all parameters' do
    it { should contain_class('hiera_createresource') }
  end
end
