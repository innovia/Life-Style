class Page < ActiveRecord::Base
  has_attached_file :background_picture,
                    :styles => {:bkg => "699x465>", :thumb => "100x100>"},
                    :default_url => "/images/Backgrounds/salon_back_panoramic.jpg"  
end