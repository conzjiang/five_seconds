class User < ActiveRecord::Base
  enum status: ["Employed", "Actively Looking", "Doing My Own Thing"]

  validates :first_name, :last_name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password,
    length: { minimum: 6, allow_nil: true },
    confirmation: true
  validates :password_confirmation, presence: true, on: :create

  has_many :sessions

  attr_reader :password

  def password=(password)

  end
end