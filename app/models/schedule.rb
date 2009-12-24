class Schedule < ActiveRecord::Base
  belongs_to :stylist
  before_save :manually_serialize_day
  
  
  def manually_serialize_day
   unless self.day.nil? or self.day.empty?
     self.day = self.day.join(",")
   else
     self.day = ''
   end
  end
end
