class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction
end
