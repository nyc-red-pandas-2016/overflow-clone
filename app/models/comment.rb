class Comment < ActiveRecord::Base
  # Remember to create a migration!

  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable
end
