Feature: A buyer accepts a proposal for thier project 

  Background:
    Given a buyer wiht a project exists
      And a creative exists
      And the buyer signs in
      And a they have a project
      And the project has proposals 
      And they are on the proposal show page
      And they should see the acceptance options

  Scenario: they should be able to accept the proposal
      And when they submit the accept option 
    Then their choice should be commmited

  Scenario: they should be able to decline the proposal
      And when they submit the decline option 
    Then their choice should be stored as declined
    
