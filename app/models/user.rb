class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :login, :email, :password, :password_confirmation, :openid_identifier
  
  
  def active?
      active
  end
  
  def activate!
      self.active = true
      save
  end
  
end
