class Item < ActiveRecord::Base
  validates :description, presence: true

  belongs_to :experience
end