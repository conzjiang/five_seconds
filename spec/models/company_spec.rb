RSpec.describe Company do
  it { should validate_presence_of(:name) }
  it { should have_many(:experiences) }
  it { should have_many(:employees) }
end