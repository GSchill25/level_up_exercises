Feature: Mangae User
  In order to learn from ruby questions
  As a user
  I want to see my managed questions and versions

  Scenario: View Profile Page With Versions
    Given I have a Stack Exchange account
    And I am on the questions page
    When I follow "Login With Stack Exchange"
    And I follow "Profile"
    Then I should see "stackname222"
    And I should see "Ruby Version"
    And I should see "Rails Version"
    Then I press "Ruby Version"
    And I should see "2.2.0"
    Then I press "Rails Version"
    And I should see "4.2.1"