
Given /^there's at least 1 product$/ do
  @product = Product.make
end

Then /^I should see product Header$/ do
  response.should have_selector("h4", :content => @product.title.upcase)
end


Then /^I should see product description$/ do
  response.should have_selector("h4", :content => @product.info)
end