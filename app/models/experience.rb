class Experience < ActiveRecord::Base
  validates :title, :start_date, :company, presence: true

  belongs_to :user
  belongs_to :company, inverse_of: :experiences
  has_many :items

  def company_name
    company.name
  end

  def current?
    self.start_date.present? && self.end_date.nil?
  end

  def duration_in_months
    end_date = self.end_date || Date.current
    date_in_months(end_date) - date_in_months(start_date) + 1
  end

  private
  def date_in_months(date)
    date.year * 12 + date.month
  end
end