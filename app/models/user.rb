require 'bcrypt'
class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides

  include BCrypt

  has_secure_password
end
