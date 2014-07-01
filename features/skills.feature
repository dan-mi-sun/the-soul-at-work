Feature: Skills

  Background: 
    Given a user exists
      And skills exist
      And a user has skills
      And a user signs in
      And the user is on the edit profile page
      And the edit profile page has skills

  Scenario: Add skills to user profile
    When they choose to add more than one skills
      And the user submits the form
    Then Their profile should be updated
