class Attraction < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :users, through: :rides
end
