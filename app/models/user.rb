class User < ActiveRecord::Base
  enum status: ["Employed", "Actively Looking", "Doing My Own Thing"]

  validates :first_name, :last_name, :password_digest, presence: true
end