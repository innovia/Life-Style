Feature: pictures
  In order to manage the list of pictures
  As an admin
  I want to see a list of pictures

@index
Scenario: list of pictures
  Given there's at least 1 picture
  When I go to the pictures page
  Then I should see "Services pictures"
	And I should see picture Header

@add_new_picture
	Scenario: add new picture 
	  Given there's at least one picture
	  When I go to the pictures pages
		
		And I click on "Add a new picture"
		Then I should see "New Service picture"
		Then I should see "go back to pictures"
		
		When I fill in "name" with "Salon Director"		
		And I press "add picture"
		
		Then I should see "picture was successfully created."
		And  I should see "Salon Director"
	

@edit_picture
	Scenario: Edit an existing picture
	  Given there's at least 1 picture
	  When I go to the pictures page
	 	And I click on "edit"
	  
		And I fill in "name" with "my new one"
		And I press "save changes"
		Then I should see "Changes were saved"
	

@delete_picture
	Scenario: remove a picture
		Given there's at least 1 picture
		When I go to the pictures page
	  And I click on "X"
		Then I should see "picture removed"
