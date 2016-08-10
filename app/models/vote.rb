class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :votable, polymorphic: true
end
