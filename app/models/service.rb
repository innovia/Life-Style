class Service < ActiveRecord::Base
  belongs_to :stylist
  belongs_to :category
  
  validates_presence_of :name
  
end
