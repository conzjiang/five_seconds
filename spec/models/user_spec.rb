RSpec.describe User do
  subject(:user) { create(:user) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_confirmation_of(:password) }

  it "doesn't test password confirmation on update" do
    user.password_confirmation = nil
    expect(user).to be_valid
  end
end