Given(/^the user is on the edit profile page$/) do
  visit edit_user_path
end

When(/^the user updates their basic info$/) do
  @username = Faker::Internet.user_name
  @about = Faker::Lorem.paragraph
  @location = Faker::Address.city
  @language = "English"
  @skills = "Ruby"
  fill_in("Username", :with => @username)
  fill_in("About", :with => @about)
  fill_in("Location", :with => @location)
  fill_in("Languages", :with => @language)
  fill_in("Skills", :with => @skills)
end

When(/^the user submits the form$/) do
  click_on "Update"
end

Then(/^thier profile should be updated$/) do
  @user.reload
  expect(@user.username).to eq(@username)
  expect(@user.about).to eq(@about)
  expect(@user.location).to eq(@location)
  expect(@user.languages).to eq(@language)
  expect(@user.skills).to eq(@skills)
end

