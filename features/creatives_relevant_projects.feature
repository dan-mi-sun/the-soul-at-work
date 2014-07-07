Feature: Display Relevant Projects Where Expertise Match Project Required Skills 

  Background:
    Given a user exists
      And a user signs in
      And a project exists
      And skills exist
      And a project has skills 
      And the user has skills
      And We are in the profile page

  Scenario: a creative sees some projects for which they have the desired expertise
    Then they should see some projects with matching skills
    
    
