RSpec.describe Experience do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:start_date) }
  it { should belong_to(:user) }

  describe "#duration_in_months" do
    it "calculates the duration of the work experience in months" do
      exp = Experience.new(
        start_date: Date.new(2010, 12),
        end_date: Date.new(2012, 3)
      )

      expect(exp.duration_in_months).to eq(15)
    end

    it "calculates months until now if end date not given" do
      exp = Experience.new(start_date: Date.new(2014, 12))
      allow(Date).to receive(:current).and_return(Date.new(2015, 2, 12))

      expect(exp.duration_in_months).to eq(2)
    end
  end
end