Given(/^a they have a project$/) do
  @project = Project.create!(:title => Faker::Company.name, 
                             :description => Faker::Company.catch_phrase,
                             :about => Faker::Company.bs,
                             :closing_date => "2020-06-16",
                             :buyer_id => @buyer.id
                            )
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
