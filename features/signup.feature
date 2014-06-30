Feature: Sign Up

  Background:
    Given that a user is on the signup page

  Scenario: a Buyer signs up
    When a "Buyer" completes the form with valid information
    Then a "Buyer" account should be created
      And their account type should be recorded
      And thier birthday should be recorded

  Scenario: a Creative signs up
    When a "Creative" completes the form with valid information
    Then a "Creative" account should be created
      And their account type should be recorded
      And thier birthday should be recorded
