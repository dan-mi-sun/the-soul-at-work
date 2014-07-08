Feature: A buyer accepts a proposal for thier project 

  Background:
    Given a buyer exists
      And a buyer signs in
      And a project exists
      And a project has proposals 
      And they are on the proposal show page

  Scenario: they should be able to accept the proposal
    Then they should see the acceptance buttons
      And when they submit the accept option 
    Then their choice should be commmited
    
