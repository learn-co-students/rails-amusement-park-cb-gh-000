class Attraction < ActiveRecord::Base
  has_many :rides, :foreign_key => "attraction_id"
  has_many :users, through: :rides
end
