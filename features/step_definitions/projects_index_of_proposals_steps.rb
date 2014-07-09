Given(/^a creative exists$/) do
  @email = Faker::Internet.email

  @creative = User.create!(:username => Faker::Name.first_name,
    :password => "password",
    :type => "Creative",
    :about => Faker::Lorem.paragraph,
    :location => Faker::Address.city,
    :email => @email
    )
end

Given(/^a creative signs in$/) do
  visit new_user_session_path
  fill_in("Email", :with => @email)
  fill_in("Password", :with => 'password')
  click_button("Sign in")
end

Given(/^a project has proposals$/) do
  @proposal = Proposal.create!(:title => "Ruby Proposal", :description => Faker::Lorem.sentence, :about => Faker::Lorem.sentence, :creative_id => @creative.id)
  @project.proposals << @proposal
end

Given(/^We are on the project show page$/) do
  visit project_path(@project)
end

Then(/^they should see the proposals which have been submitted to the project$/) do
  expect(page.has_content?(@proposal.title)).to be true
end
