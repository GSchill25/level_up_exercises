Feature: Manage Bomb App
  In order to make an explosion
  As an evil villain
  I want to create and manage a bomb
  
  Scenario: Homepage
    Given I am on the homepage
    Then I should see "Bomb is Inactive"
    And I should see "Set Activation Code"
    And I should see "Set Deactivation Code"
    And I should see "Activation"
    And I should not see "Bomb is Active"
    And I should not see "seconds"
    And I should see "Tick Tick Boom"
    And I should see "Wrong Deactivation Attempts: 0"

  Scenario: Update Activation Code
  	Given I am on the homepage
    And I fill in "5555" for active_code
    When I press "Set Active Code"
    Then I should not see "Set Activation Code"
  
  Scenario: Update Deactivation Code
    Given I am on the homepage
    And I fill in "2222" for deactive_code
    When I press "Set Deactive Code"
    Then I should not see "Set Deactive Code"

  Scenario: Activate Fails with Wrong Code
    Given I am on the homepage
    And I fill in "0000" for activation_code
    When I press "Activate"
    Then I should not see "Bomb is Active!"
    And I should see "Bomb is Inactive"

  Scenario: Activate Bomb
    Given I am on the homepage
    And I fill in "5555" for activation_code
    When I press "Activate"
    Then I should see "Bomb is Active!"
    And I should not see "Bomb is Inactive"
    And I should see "20 seconds"
    And I should see "Deactivate"

  Scenario: Bomb Blows Up
    Given I am on the homepage
    When I press "red_button"
    And I wait for 25 seconds
    Then I should see "BOOM"
    And I should not see "Deactivate"
    And I should not see "seconds"


# Need selenium to test javascript


    
