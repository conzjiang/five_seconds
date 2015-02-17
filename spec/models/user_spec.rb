RSpec.describe User do
  subject(:user) { create(:user) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_confirmation_of(:password) }
  it { should have_many(:sessions) }
  it { should have_many(:experiences) }

  it "doesn't test password confirmation on update" do
    user.password_confirmation = nil
    expect(user).to be_valid
  end

  it "sets password digest on submission of password" do
    user = build(:user)
    expect(user.password_digest).not_to be_nil
  end

  it "sets 'Employed' as default status" do
    expect(User.new.status).to eq("Employed")
  end

  describe "::find_by_credentials" do
    it "finds a user by email and password" do
      user = create(:user, email: "aaa", password: "123456")
      expect(User.find_by_credentials("aaa", "123456")).to eq(user)
    end

    it "returns nil if none is found" do
      expect(User.find_by_credentials("aaa", "bbbbbb")).to be_nil
    end
  end

  describe "#full_name" do
    it "combines first and last name" do
      full_name = "#{user.first_name} #{user.last_name}"
      expect(user.full_name).to eq(full_name)
    end
  end

  describe "#set_session_token!" do
    it "creates a session" do
      user.set_session_token!
      expect(user.sessions).not_to be_empty
    end

    it "returns session token" do
      expect(user.set_session_token!).to eq(user.sessions.first.session_token)
    end
  end
end