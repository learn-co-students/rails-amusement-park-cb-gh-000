class User < ActiveRecord::Base

  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  after_initialize :set_admin_state

  def set_admin_state
    if self.admin.nil?
      self.admin ||= false
      self.save
    end
  end

  def mood
    self.nausea < self.happiness ? 'happy' : 'sad'
  end

end
