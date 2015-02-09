class Session < ActiveRecord::Base
  validates :session_token, presence: true

  belongs_to :user

  after_initialize :generate_session_token

  private
  def generate_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end