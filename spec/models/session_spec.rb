RSpec.describe Session do
  it { should validate_presence_of(:session_token) }
  it { should belong_to(:user) }

  it "generates session token upon initialization" do
    session = Session.new
    expect(session.session_token).not_to be_nil
  end

  it "persists its initially-set session token" do
    session = Session.create!
    expect(session.session_token).to eq(Session.first.session_token)
  end
end