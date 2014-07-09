Given(/^the creative is on the project page$/) do
  visit project_path(@project)
end

When(/^they choose start a pitch$/) do
  click_link("Submit a Pitch")
end

Then(/^then they should be taken to the edit pitch page$/) do
  visit new_project_proposal_path(@project)
  expect(page).to have_content 'Your Proposal'
end

Then(/^when they complete the form$/) do
  fill_in "Title", :with => Faker::Company.name
  fill_in "Description", :with => Faker::Company.catch_phrase
  fill_in "About", :with => Faker::Company.bs
  click_on "Update"
end

Then(/^their pitch should be submitted$/) do
  expect(Proposal.count).to eq(1)
end

