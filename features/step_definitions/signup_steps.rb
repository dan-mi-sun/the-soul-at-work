Given(/^that a user is on the signup page$/) do
  visit new_user_registration_path
end

When(/^a "(.*?)" completes the form with valid information$/) do |user|
  @type = user
  within '#user_email' do
    fill_in 'Email', :with => 'test@test.org'
  end
   
   fill_in 'Password', :with => 'password'
   fill_in 'Password confirmation', :with => 'password'
   fill_in 'Username', :with => Faker::Internet.user_name
   within "#user_birthday_3i" do
     select '1'
   end
   within "#user_birthday_2i" do
     select 'June'
   end
   within "#user_birthday_1i" do
     select '1970'
   end
   within("#account-type") do
     choose(user)
   end
   save_and_open_page
   binding.pry
   click_button('Sign up')
end

Then(/^a "(.*?)" account should be created$/) do |user|
  user.constantize.count.should eq(1)
end

Then(/^their account type should be recorded$/) do
  User.first.type == @type
end

Then(/^thier birthday should be recorded$/) do
  User.first.birthday == "Mon, 01 Jun 1970"
end
