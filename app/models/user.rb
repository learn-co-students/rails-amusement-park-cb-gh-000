class User < ActiveRecord::Base
  # write associations here
  has_secure_password

  has_many :rides, :foreign_key => "user_id"
  has_many :attractions, through: :rides

  # validates_presence_of :name, :password, :happiness, :nausea, :height, :tickets

  def mood
    if nausea > happiness
      "sad"
    else
      "happy"
    end
  end
end
