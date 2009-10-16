class Stylist < ActiveRecord::Base
  has_many :services
  has_attached_file :photo, 
                    :styles => {:small => "150x150>", :thumb => "100x100>", :original => "300x300"}, 
                    :default_url => "/images/missing.png"  
  def full_name
      [first_name, last_name].join(' ') 
  end
  
  
end
