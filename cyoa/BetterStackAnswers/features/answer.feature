Feature: Manage Answers
  In order to learn from ruby qyestions
  As a user or developer
  I want to add/edit answers to the questions

  Background: Basic Questions
    Given I have some basic questions

  Scenario: Create New Question with Answer
    Given I am on the questions page
    When I follow "New Q"
    And I fill in "question_tags" with "ruby,rails"
    And I fill in "question_title" with "What's an array?"
    And I fill in "question_body" with "<p>Yea so like is it this []?</p>"
    And I fill in "question_answer_attributes_body" with "<p>You have much to learn.</p>"
    And I press "Create Question"
    Then I should see "Question was successfully created"
    And I should see "What's An Array?"
    And I should see "You have much to learn."

  Scenario: Answer an Existing Question
    Given I am on the questions page
    When I follow "edit_question"
    Then I should see "Is the sky blue?"
    And I fill in "question_answer_attributes_body" with "<p>Yep, on sunny days.</p>"
    And I press "Update"
    Then I should see "Question was successfully updated."
    And I should see "Yep, on sunny days."

