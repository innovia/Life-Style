# Generates random service
class CategoryForgery < Forgery
  def self.name
    dictionaries[:categories].random
  end
end