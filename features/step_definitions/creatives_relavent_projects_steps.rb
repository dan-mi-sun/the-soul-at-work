Given(/^a project has relevant skills$/) do
  @skill = Skill.create!(:name => "MXP")
  @project.skills << @skill
end

Given(/^the creative has skills$/) do
  @creative.skills << @skill 
end

Then(/^they should see some projects with matching skills$/) do
  expect(page.has_content?(@project.title)).to be true
end
