Given(/^a project exists$/) do
  @project = Project.create!(:title => Faker::Company.name, 
                             :description => Faker::Company.catch_phrase,
                             :about => Faker::Company.bs,
                             :closing_date => "2020-06-16")
end

Given(/^a project has skills$/) do
  @project.skills(:skill_ids => [0])
end

Given(/^the user is on the edit project page$/) do
  visit edit_project_path(@project)
end

Given(/^the edit project page has skills$/) do
  @skills = Skill.all
  @skills.each do |skill|
    expect(page.has_content?(skill.name)).to be true
  end
end

When(/^they choose to add more than one skill$/) do
  select('Ruby', :from => 'project_skill_ids')
  select('Javascript', :from => 'project_skill_ids')
end

When(/^they submit the form$/) do
  click_on('Update Project')
end

Then(/^the project should be updated$/) do
  @project.reload
  counter = 0
  @requisites = @project.skills.all
  @requisites.each do |skill|
    counter+=1
  end
  expect(counter).to eq(2)
end

Then(/^thier selection should be saved$/) do
  visit project_path(@project)
  page.should have_content("Ruby")
  page.should have_content("Javascript")
end

