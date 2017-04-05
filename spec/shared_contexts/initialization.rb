shared_context 'initialization' do
  let(:endpoint) { 'tcp://localhost:5555' }

  subject { described_class.new(endpoint: endpoint) }

  after { subject.stop }
end
