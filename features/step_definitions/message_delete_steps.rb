Given(/^that we are on the message index page$/) do
  visit messages_path
end

Given(/^we select "(.*?)"$/) do |link|
  click_on link
end


Given(/^the user has a message from "(.*?)"$/) do |user|
	sender = User.find_by(:username => user)
  joe = User.create!(:email => "joe@example.com", :password => "password", :username => "joe-b", :type => "Creative" )
  @message = Message.create!(:subject => "Test Subject", :body => "This is a message from Joe Bloggs", :sender => sender, :receiver => joe)
end

Then(/^we should see that message$/) do
  visit message_path(@message.reload)
  expect(page.has_content?("Test Subject")).to be true
end

Then(/^that message should be deleted$/) do
  visit messages_path
  expect(page.has_content?(@message.body)).to be false
end

