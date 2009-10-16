class Picture < ActiveRecord::Base
  has_attached_file :photo,
                    :path => ":attachment/:id/:style.:extension",
                    :styles => {:small => "150x150>", :thumb => "100x100>", :original => "400x400>"}
end
