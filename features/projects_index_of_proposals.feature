Feature: Display Submitted Proposaals for a Project 

  Background:
    Given a creative exists
      And a creative signs in
      And a project exists
      And a project has proposals 
      And We are on the project show page

  Scenario: we should see an index of submitted proposals on the project show page
    Then they should see the proposals which have been submitted to the project
    
    
