class Session < ActiveRecord::Base
  validates :session_token, presence: true

  belongs_to :user
end