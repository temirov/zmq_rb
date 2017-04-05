shared_examples 'it has proper mode' do
  its(:mode) { is_expected.to eq(mode) }
end
