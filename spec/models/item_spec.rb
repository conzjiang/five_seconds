RSpec.describe Item do
  it { should validate_presence_of(:description) }
  it { should belong_to(:experience) }
end