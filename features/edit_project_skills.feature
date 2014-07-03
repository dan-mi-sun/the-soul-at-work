Feature: Edit Project Skills

  Background: 
    Given a project exists
      And skills exist
      And a project has skills
      And a user signs in
      And the user is on the edit project page
      And the edit project page has skills

  Scenario: Add skills to project
    When they choose to add more than one skill
      And the user submits the form
    Then Their profile should be updated
      And thier selection should be saved
