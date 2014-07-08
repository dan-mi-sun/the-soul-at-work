Given(/^a project has proposals$/) do
  @proposal = Proposal.create!(:title => "Ruby Proposal", :description => Faker::Company.bs, :about => Faker::Commerce.department)
  @project.proposals << @proposal
end

Given(/^We are on the project show page$/) do
  visit project_path(@project)
end

Then(/^they should see the proposals which have been submitted to the project$/) do
  expect(page.has_content?(@proposal.title)).to be true
end
