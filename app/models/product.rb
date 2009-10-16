class Product < ActiveRecord::Base
  has_attached_file :photo, 
                    :styles => {:thumb => "100x100", :medium => "300x300" },  
                    :default_url => "/images/missing_product.png"  
end
