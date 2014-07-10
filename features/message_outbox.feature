Feature: Outbox feature

  Background: 
    Given we have a logged-in user called "joe"
    And "joe" has messages in his inbox 

  Scenario: A user sees their outbox
    Given that we are on the inbox page
      And we select "outbox"
      And there are messages in his outbox 
    Then we should view the sent messages

