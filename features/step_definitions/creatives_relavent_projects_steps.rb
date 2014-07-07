Given(/^the user has skills$/) do
  @user.skills = Skill.create!(:name => "MXP")
end

Then(/^they should see some projects with matching skills$/) do
  pending # express the regexp above with the code you wish you had
end


#This unit test.
#how to assign a skill to an object, so that I can assign this to the user also.
#undefined method `each' for "Ruby":String
#Then I will be able to check if that is in the page

#current implementation displays all projects to a creative, not just ones for which they have expertise
#
#pulling the logic out of the view and into the model
#does this do in the project or the creative?
#
#writing a unit test for this

