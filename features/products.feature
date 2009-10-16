Feature: Products
  In order to manage the list of products
  As an admin
  I want to see a list of products

# Features of products
@index
Scenario: list of products
  Given there's at least 1 product
  When I go to the products page
  Then I should see "Products"
	And I should see product Header
	And I should see product description


@add_new_product
	Scenario: add new product 
	  Given there's at least one category
	  When I go to the products pages
		
		And I follow "add product"
		Then I should see "Add a new product"
		Then I should see "go back to products"
		
		When I fill in "name" with "S-factor"		
		And I fill in "Product Information" with "lorem ipsum doller"
		And I press "add product"
		
		Then I should see "product was successfully created."

	

@edit_product
	Scenario: Edit an existing product
	  Given there's at least 1 product
	  When I go to the products page
	 	And I click on "edit product"
	  
		And I fill in "name" with "my new one"
		And I fill in "product information" with "lorem ipsum"
		And I press "save changes"
		Then I should see "Changes were saved"
	

@delete_product
	Scenario: remove a product
		Given there's at least 1 product
		When I go to the products page
	  And I click on "delete icon"
		Then I should see "product removed"
