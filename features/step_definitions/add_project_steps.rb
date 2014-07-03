Given(/^that I am on the homepage$/) do
  visit root_path
end

Given(/^I choose to add a project$/) do
  click_link 'Start A Project'
end

When(/^I complete the form with valid information$/) do
  fill_in "Title", :with => Faker::Company.name
  fill_in "Description", :with => Faker::Company.catch_phrase
  fill_in "About", :with => Faker::Company.bs
  within "#project_closing_date_3i" do
    select '13'
  end
  within "#project_closing_date_2i" do
    select 'January'
  end
  within "#project_closing_date_1i" do
    select '2015'
  end
  click_on "Update"
end

Then(/^a project should be created$/) do
  expect(Project.count).to eq(1)
end
