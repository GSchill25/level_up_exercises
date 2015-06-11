Feature: Manage Login
  In order to learn from ruby questions
  As a user
  I want to login with stack overflow

  Scenario: Reject Fake Credentials
    Given I do not have a Stack Exchange account
    And I am on the questions page
    When I follow "Login With Stack Exchange"
    Then I should see "Invalid Stack Exchange Account"
    And I should not see "Logged In"
    And I should not see "Logout"

  Scenario: Login a Stack Exchange User
    Given I have a Stack Exchange account
    And I am on the questions page
    When I follow "Login With Stack Exchange"
    Then I should see "Logged In"
    And I should see "stackname222"
    And I should see "Logout"
    And I should not see "Login With Stack Exchange"
    And I should see "Profile"

  Scenario: Login and Then Logout
    Given I have a Stack Exchange account
    And I am on the questions page
    When I follow "Login With Stack Exchange"
    Then I should see "Logged In"
    And I follow "Logout"
    Then I should see "You have been logged out."



