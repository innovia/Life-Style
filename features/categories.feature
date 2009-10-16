Feature: categories
  In order to manage the list of categories
  As an admin
  I want to see a list of categories

@index
Scenario: list of categories
  Given there's at least 1 category
  When I go to the categories page
  Then I should see "Services Categories"
	And I should see category Header


@add_new_category
	Scenario: add new category 
	  Given there's at least one category
	  When I go to the categories pages
		
		And I click on "Add a new category"
		Then I should see "New Service Category"
		Then I should see "go back to categories"
		
		When I fill in "name" with "Salon Director"		
		And I press "add category"
		
		Then I should see "Category was successfully created."
		And  I should see "Salon Director"
	

@edit_category
	Scenario: Edit an existing category
	  Given there's at least 1 category
	  When I go to the categories page
	 	And I click on "edit"
	  
		And I fill in "name" with "my new one"
		And I press "save changes"
		Then I should see "Changes were saved"
	

@delete_category
	Scenario: remove a category
		Given there's at least 1 category
		When I go to the categories page
	  And I click on "X"
		Then I should see "category removed"
