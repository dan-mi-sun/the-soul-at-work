Given(/^the user is on the edit proposal page$/) do
  visit edit_project_proposal_path(@project, @proposal)
end

When(/^the user updates their proposal info$/) do
  @about = Faker::Lorem.sentence
  @description= Faker::Lorem.sentence
  fill_in 'About', :with => @about 
  fill_in 'Description', :with => @description 
end

When(/^the user submits the form to update$/) do
  click_button 'Update Proposal'
end

Then(/^thier proposal should be updated$/) do
  visit project_proposal_path(@project, @proposal)
  expect(page.has_content?(@about)).to be true
  expect(page.has_content?(@description)).to be true
end
