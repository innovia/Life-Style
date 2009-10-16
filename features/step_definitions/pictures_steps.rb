
Given /^there's at least 1 category$/ do
  @category = Category.make
end

Then /^I should see category Header$/ do
  response.should have_selector("td", :content => @category.name.camelize)
end