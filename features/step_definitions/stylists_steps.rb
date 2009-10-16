
Given /^there's at least 1 stylist$/ do
  @stylist = Stylist.make
end

Then /^I should see stylist Header$/ do
  response.should have_selector("p", :content => @stylist.full_name.camelize)
end


Then /^I should see stylist description$/ do
  response.should have_selector("div", :content => @stylist.bio)
end

When /^I see the stylist photo$/ do
  response.should have_selector("img.stylist_image")
end

