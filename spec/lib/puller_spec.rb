require 'spec_helper'
require 'shared_contexts/initialization'
require 'shared_examples/mode'

RSpec.describe ZmqRb::Puller do
  include_context 'initialization' do
    it_behaves_like 'it has proper mode' do
      let(:mode) { :PULL }
    end
  end
end
