Feature: Edit Proposal

  Scenario: A creative edits their proposal
    Given a user exists
      And a user signs in
      And the user is on the edit proposal page
    When the user updates their proposal info 
      And the user submits the form
    Then thier proposal should be updated
