Feature: Appointments
  In order to send a request for an appointment
  As a guest
  I want to fillup my request in a form

	

  Scenario: Fill up a request form
    Given I am on the appoinment request form
    When I fill up the form
	  Then I should receive an email
  
  
  
