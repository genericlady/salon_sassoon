describe 'User' do
  let(:cynthia) { FactoryGirl.build_stubbed(:user) }

  it 'has a username' do
    expect(cynthia.username).to eq('sparkles')
  end
end
