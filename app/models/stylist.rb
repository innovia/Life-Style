class Stylist < ActiveRecord::Base
  has_many :services
  has_many :schedules
  has_attached_file :photo, 
                    :styles => {:small => "150x150>", :thumb => "100x100>", :original => "300x300"}, 
                    :default_url => "/images/missing.png"  
  
  validates_presence_of :first_name, :bio
  
  def full_name
      unless last_name.nil?
        [first_name, last_name].join(' ') 
      else
        return first_name
      end
  end
  
  
end
