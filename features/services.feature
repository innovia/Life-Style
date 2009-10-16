Feature: Services
  In order to manage the list of services
  As an admin
  I want to see a list of services

# Features of Services
Scenario: list of services
  Given there's at least 1 service
  When I go to the services page
  Then I should see "Services"
	And I should see Service Header
	And I should see Service description with prices

@add_first_service_db_empty
Scenario: add first service database is empty
  Given I am on the services page
	Then I should see "There are no services in the database"
	And I should see "Start by creating a category for the service"
	
	When I follow "new category"
	Then I should see "New Service Category"
	
	When I fill in "name" with "salon director"
	And I press "add category"
	Then I should see "Category was successfully created."

@add_new_service
	Scenario: add new service 
	  Given there's at least one category
	  When I go to the services pages
		
		And I follow "add service"
		Then I should see "Add a new service"
		Then I should see "go back to services"
		
		When I fill in "name" with "women hair cut"
		And I fill in "start price" with "30"
		And I fill in "end price" with "50"
		And I press "add service"
		
		Then I should see "Service was successfully created."
		And I should see "women hair cut"
		And I should see "$30"
		And I should see "$50"
	
@edit_service
	Scenario: Edit an existing service
	  Given there's at least 1 service
	  When I go to the services page
	 	And I click on "edit service"
	  
		And I fill in "name" with "my new one"
		And I press "save changes"
		Then I should see "Changes were saved"
	
@delete_service
	Scenario: remove a service
		Given there's at least 1 service
		When I go to the services page
	  And I click on "delete icon"
		Then I should see "Service removed"
	