Feature: Inbox feature

  Background: 
    Given we have a logged-in user called "joe"
    And "joe" has messages in his inbox 

	Scenario: A user views their inbox
		Given that we are on the homepage
		And we click on "Inbox"
		Then we should be able to view the messages in our inbox
