Given(/^a buyer exists$/) do
  @buyer = User.create!(:username => Faker::Name.first_name,
    :password => "password",
    :type => "Buyer",
    :about => Faker::Lorem.paragraph,
    :location => Faker::Address.city,
    :email => @email = Faker::Internet.email
    )
end

Given(/^a buyer has projects$/) do
  @title = "this is more the four"
  Project.create!(:buyer_id => @buyer.id, 
                  :title => @title,
                  :description => "222222222222222",
                  :about => "333333333333333",
                  :closing_date => "2020-06-16"
    )
end

Given(/^a buyer signs in$/) do
  visit new_user_session_path
  fill_in("Email", :with => @email)
  fill_in("Password", :with => 'password')
  click_button("Sign in")
end

Given(/^that the buyer is on their profile$/) do
  visit me_user_path(@buyer)
end

Then(/^they should see the project displayed on their profile$/) do
  expect(page.has_content?(@title)).to be true
end

