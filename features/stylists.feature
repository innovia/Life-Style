Feature: Stylists
  In order to manage the list of Stylists
  As an admin
  I want to see a list of Stylists

# Features of Stylists
@index
Scenario: list of Stylists
  Given there's at least 1 stylist
  When I go to the stylists page
  Then I should see "Stylists"
	And I should see stylist Header


@add_new_stylist
	Scenario: add new stylist 
	  Given I am on the stylists page
		And I click on "add stylist"
		Then I should see "Add a new stylist"
		Then I should see "go back to Stylists"
		
		When I fill in "first name" with "haim"
		And I fill in "last name" with "hazan"		
		And I fill in "stylist bio" with "this is my bio"
		And I press "add stylist"
		Then I should be on the stylist page
		Then I should see "Stylist was successfully created."
		And I should see "haim hazan"
			

@edit_stylist
	Scenario: Edit an existing stylist
	  Given there's at least 1 stylist
	  When I go to the stylists page
	 	And I see the stylist photo
		And I click on "Show Stylist"
		Then I should see "Edit Stylist"
	  And I click on "Edit Stylist"
		And I fill in "first name" with "Jody"
		And I fill in "last name" with "hazan"		
		And I fill in "Stylist bio" with "Lorem ipsum dolor sit amet"
		And I press "save changes"
		Then I should see "Changes were saved"
		And I should see "Jody hazan"
		And I should see "Lorem ipsum dolor sit amet"
	

@delete_stylist
	Scenario: remove a stylist
		Given there's at least 1 stylist
		When I go to the stylists page
	  And I click on "delete icon"
		Then I should see "Stylist removed"
