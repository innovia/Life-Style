class Service < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :name, :category_id
  validates_numericality_of :stylist_start_price, :stylist_end_price,
                            :senior_start_price, :senior_end_price, 
                            :master_start_price, :master_end_price
end
