class Service < ActiveRecord::Base
  belongs_to :stylist
  belongs_to :category
  has_many :specials
  validates_presence_of :name
  
end
