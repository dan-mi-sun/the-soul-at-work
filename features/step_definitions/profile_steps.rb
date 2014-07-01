Given(/^a user exists$/) do
  @email = Faker::Internet.email

  @user = User.create!(:username => Faker::Name.first_name,
    :password => "password",
    :type => "Creative",
    :about => Faker::Lorem.paragraph,
    :location => Faker::Address.city,
    :languages => "English",
    :skills => "Ruby",
    :email => @email
    )
end

Given(/^a user signs in$/) do
  visit new_user_session_path
  fill_in("Email", :with => @user.email)
  fill_in("Password", :with => @user.password)
  click_button("Sign in")
end

Given(/^We are in the profile page$/) do
  visit me_user_path(@user)
end

Then(/^We should see the user's username$/) do
  expect(page.has_content?(@user.username)).to be true
end

Then(/^We should see the user's about$/) do
  expect(page.has_content?(@user.about)).to be true
end

Then(/^We should see the user's location$/) do
  expect(page.has_content?(@user.location)).to be true
end

Then(/^We should see the user's langauges$/) do
  expect(page.has_content?(@user.languages)).to be true
end

Then(/^We should see the user's skills$/) do
  expect(page.has_content?(@user.skills)).to be true
end

