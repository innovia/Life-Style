class Page < ActiveRecord::Base
  has_attached_file :background_picture,
                    :styles => {:bkg => "699x665>", :thumb => "800x800>"},
                    :default_url => "/images/Backgrounds/salon_back_panoramic.jpg"  
end