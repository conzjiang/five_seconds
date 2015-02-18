class Company < ActiveRecord::Base
  validates :name, presence: true

  has_many :experiences, inverse_of: :company
  has_many :employees, through: :experiences, source: :user
end