class User < ActiveRecord::Base
  include BCrypt

  enum status: ["Employed", "Actively Looking", "Doing My Own Thing"]

  validates :first_name, :last_name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password,
    length: { minimum: 6, allow_nil: true },
    confirmation: true
  validates :password_confirmation, presence: true, on: :create

  has_many :sessions
  has_many :experiences, -> { order(start_date: :desc) }

  attr_reader :password

  after_initialize :set_default_status

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user.try(:is_password?, password) ? user : nil
  end

  def self.statuses_list
    statuses.keys
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_password?(password)
    Password.new(password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = Password.create(password)
  end

  def set_session_token!
    new_session = sessions.create!
    new_session.session_token
  end

  private
  def set_default_status
    self.status ||= "Employed"
  end
end