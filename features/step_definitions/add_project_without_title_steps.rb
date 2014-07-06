When(/^I complete the form without a title$/) do
  fill_in "Description", :with => Faker::Company.catch_phrase
  fill_in "About", :with => Faker::Company.bs
  within "#project_closing_date_3i" do
    select '13'
  end
  within "#project_closing_date_2i" do
    select 'January'
  end
  within "#project_closing_date_1i" do
    select '2016'
  end
  click_on "Update"
end

Then(/^a project should not be created$/) do
  expect(Project.count).to eq(0)
end

Then(/^I should see an error message$/) do
  page.should have_content("Title is too short (minimum is 4 characters)")
end

