# Generates random service
class ServiceForgery < Forgery
  def self.name
    dictionaries[:services].random
  end
end