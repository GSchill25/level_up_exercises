Feature: Manage Questions
  In order to learn from ruby questions
  As a developer
  I want to keep the ruby/rails version updated

  Background: Basic Questions
    Given I have some basic questions

  Scenario: View Questions Index Page
    Given I am on the questions page
    Then I should see "Ruby Questions"
    And I should see "Better Ruby Answers"
    And I should see "Home"
    And I should see "Is the sky blue?"
    And I should see "Sky Color"
    And I should see "Ruby"
    And I should see "rails"
    And I should see "Chef"
    And I should not see "www.stackoverflow.com"
    And I should see "2.0"
    And I should see "4.2"

  Scenario: Successfully Edit a Question
    Given I am on the questions page
    When I follow "edit_question"
    Then I should see "Is the sky blue?"
    And I should not see "Chef"
    And I should see "Question body"
    And I should see "Answer body"
    When I fill in "question_title" with "Did the title change?"
    And I fill in "question_answer_attributes_body" with "<p>yes</p>"
    And I press "Update"
    Then I should see "Did The Title Change?"
    And I should see "Question was successfully updated"
    And I should not see "Sky Color"

  Scenario: Fail to Edit a Question
    Given I am on the questions page
    When I follow "edit_question"
    And I fill in "question_title" with ""
    And I press "Update"
    Then I should see "can't be blank"
    And I should not see "Question was successfully updated"

  Scenario: Add a new Questiom
    Given I am on the questions page
    When I follow "New Q"
    And I fill in "question_tags" with "ruby"
    And I fill in "question_title" with "What's a hash?"
    And I fill in "question_body" with "<p>Yea so like is it this {}?</p>"
    And I press "Create Question"
    Then I should see "Question was successfully created"
    And I should see "What's A Hash?"

  Scenario: Get more Questions from Stack Overflow
    Given I am on the questions page
    And I have a Stack Exchange account
    And I follow "Login With Stack Exchange"
    And I follow "Add Q and As"
    Then I should see "Questions and Answers Added."

  Scenario: Search by title for Questions
    Given I am on the questions page
    And I fill in "search" with "sky"
    And I press "Search"
    Then I should see "Sky Color"
    And I should not see "Chef"

