Given(/^a buyer wiht a project exists$/) do
  @buyer_email = Faker::Internet.email
  @buyer_accept = User.create!(:username => Faker::Name.first_name,
    :password => "password",
    :type => "Buyer",
    :about => Faker::Lorem.paragraph,
    :location => Faker::Address.city,
    :email => @buyer_email
    )
end

Given(/^the buyer signs in$/) do
  visit new_user_session_path
  fill_in("Email", :with => @buyer_email)
  fill_in("Password", :with => 'password')
  click_button("Sign in")
end

Given(/^a they have a project$/) do
  @project = Project.create!(:title => Faker::Company.name, 
                             :description => Faker::Company.catch_phrase,
                             :about => Faker::Company.bs,
                             :closing_date => "2020-06-16",
                             :buyer_id => @buyer_accept.id
                            )
end

Given(/^the project has proposals$/) do
  @proposal = Proposal.create!(:title => "Ruby Proposal", :description => Faker::Lorem.sentence, :about => Faker::Lorem.sentence, :creative_id => @creative.id)
  @project.proposals << @proposal
end

Given(/^they are on the proposal show page$/) do
  visit project_proposal_path(@project, @proposal)
end

Then(/^they should see the acceptance options$/) do
  expect(page.has_content?("Accept")).to be true
  expect(page.has_content?("Decline")).to be true
end

Then(/^when they submit the accept option$/) do
  select('Accept', :from => 'proposal_status')
  click_on 'Submit'
end

Then(/^their choice should be commmited$/) do
  @proposal.reload
  expect(@proposal.status).to eq(1)
end
