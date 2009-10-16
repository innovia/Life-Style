
Given /^there's at least 1 service$/ do
  @service = Service.make
end

Then /^I should see Service Header$/ do
  response.should have_selector("h4", :content => @service.category.name.upcase)
end


Then /^I should see Service description with prices$/ do
  response.should have_selector("h4", :content => @service.name)
end

Given /^there are no categories yet$/ do
  @categories  = Category.all
  @categories.empty?
end

Then /^save$/ do
  save_and_open_page()
end

Given /^there's at least one category$/ do
  @category = Category.make
end

