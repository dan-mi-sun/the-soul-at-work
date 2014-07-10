Given(/^we have a logged\-in user called "(.*?)"$/) do |name|
  email = Faker::Internet.email 
  @creative = Creative.create!(:username => name, :email => email, :password => 'password' )
  visit user_session_path
  fill_in 'Email', :with => email 
  fill_in 'Password', :with => 'password'
  click_button 'Sign in'
end

Given(/^"(.*?)" has messages in his inbox$/) do |buyer|
  email = Faker::Internet.email
  r = Buyer.create!(:username => Faker::Internet.user_name , :email => email, :password => 'password' )
  @message = Message.create!(:subject => "Hi", :body => 'Welcome to the site', :sender => r, :receiver => @creative )
end

Given(/^that we are on the homepage$/) do
  visit root_path
end

Given(/^we click on "(.*?)"$/) do |link|
  click_on link
end

Then(/^we should be able to view the messages in our inbox$/) do
  expect(page.has_content?(@message.subject)).to be true
end
