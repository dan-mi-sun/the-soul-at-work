Feature: Add a Project

  Background:
    Given a user exists
      And a user signs in
      And that I am on the homepage
      And I choose to add a project

  Scenario: a buyer adds a project
    When I complete the form with valid information
    Then a project should be created

  Scenario: a buyer adds a project without providing a title
    When I complete the form without a title
    Then a project should not be created
      And I should see an error message
