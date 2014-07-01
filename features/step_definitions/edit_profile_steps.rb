Given(/^the user is on the edit profile page$/) do
  visit edit_user_path
end

When(/^the user updates their basic info$/) do
  @username = Faker::Internet.user_name
  @about = Faker::Lorem.paragraph
  @location = Faker::Address.city
  fill_in("Username", :with => @username)
  fill_in("About", :with => @about)
  fill_in("Location", :with => @location)
end

When(/^the user submits the form$/) do
  click_on "Update"
end

Then(/^thier profile should be updated$/) do
  @user.reload
  expect(@user.username).to eq(@username)
  expect(@user.about).to eq(@about)
  expect(@user.location).to eq(@location)
end

