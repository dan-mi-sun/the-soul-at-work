Given(/^skills exist$/) do
  @skills = %w( Ruby Javascript PHP Java)
  @skills.each do |skill|
    Skill.create!(name: skill)
  end
end

Given(/^a user has skills$/) do
  @user.skills(:skill_ids => [0])
end

Given(/^the edit profile page has skills$/) do
  @skills = Skill.all
  @skills.each do |skill|
    expect(page.has_content?(skill.name)).to be true
  end
end

When(/^they choose to add more than one skills$/) do
  select('Ruby', :from => 'user_skill_ids')
  select('Javascript', :from => 'user_skill_ids')
end

Then(/^Their profile should be updated$/) do
  @user.reload
  counter = 0
  @expertise = @user.skills.all
  @expertise.each do |skill|
    counter+=1
  end
  expect(counter).to eq(2)
end

