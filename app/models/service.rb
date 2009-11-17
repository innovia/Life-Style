class Service < ActiveRecord::Base
  belongs_to :category
  has_many :specials
  validates_presence_of :name, :category_id
  validates_numericality_of :beginner_start_price, :beginner_end_price,
                            :intermidiate_start_price, :intermidiate_end_price, 
                            :senior_start_price, :senior_end_price
end
