class Answer < ActiveRecord::Base
  # Remember to create a migration!

  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
end
