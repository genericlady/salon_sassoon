describe 'User' do
  let(:user) { FactoryGirl.build_stubbed(:user) }

  it 'has a username' do
    expect(user.username).to eq('sparkles')
  end
end
