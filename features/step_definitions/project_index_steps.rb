Given(/^that I am on the project index page$/) do
  visit projects_path
end

Given(/^more than one project exists$/) do
  3.times { Project.create!(:title => Faker::Commerce.department, :description => Faker::Commerce.product_name, :about => Faker::Company.bs, :closing_date => "2020-06-16") }
end

Then(/^we should see a list of these projects$/) do
  expect(Project.count).to eq(3)
end

