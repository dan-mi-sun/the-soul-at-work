Feature: Edit Profile

  Scenario: A user edits their profile
    Given a user exists
      And a user signs in
      And the user is on the edit profile page
    When the user updates their basic info 
      And the user submits the form
    Then thier profile should be updated
