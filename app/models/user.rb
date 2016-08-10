class User < ActiveRecord::Base
  # Remember to create a migration!

  has_many :comments
  has_many :answers
  has_many :questions
  has_many :votes

  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A\w+@\w+[.]\w+\z/, message: "must be a valid e-mail address."}
  validates :password, length: {minimum: 6}, format: {with: /[A-Z]/, message: "must have at least one capital letter."}

end
