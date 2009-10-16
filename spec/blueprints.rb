require 'machinist/active_record'
require 'sham'
require 'forgery'

# Sham - Generating Attribute Values
Sham.define do
  login                          { InternetForgery.user_name }
  email                          { InternetForgery.email_address }
  pwd = BasicForgery.password
  password                       { pwd }
  password_confirmation          { pwd }
end

# Blueprints - Generating Objects

Category.blueprint do
  name  { CategoryForgery.name }
end

Service.blueprint do
  name      { ServiceForgery.name }
  category
  start_price {Forgery(:monetary).money}
end

Product.blueprint do
  title { "S-factor" }
  info { LoremIpsumForgery.paragraph}
end

Picture.blueprint do
  title {LoremIpsumForgery.word}
  description {LoremIpsumForgery.paragraph}
end

Stylist.blueprint do
  first_name  {NameForgery.first_name}
  last_name   {NameForgery.last_name}
  bio         {LoremIpsumForgery.paragraph}
end