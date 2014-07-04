Feature: Edit Project Skills

  Background: 
    Given a user exists
      And a user signs in
      And a project exists
      And skills exist
      And a project has skills
      And the user is on the edit project page
      And the edit project page has skills

  Scenario: Add skills to project
    When they choose to add more than one skill
      And they submit the form
    Then the project should be updated
      And thier selection should be saved
