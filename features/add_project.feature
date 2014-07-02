Feature: Add a Project

  Scenario: a buyer adds a project
    Given that I am on the homepage
      And I choose to add a project
    When I complete the form with valid information
    Then a project should be created
