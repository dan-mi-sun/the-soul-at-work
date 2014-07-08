Given(/^when they submit the decline option$/) do
  select('Decline', :from => 'proposal_status')
  click_on 'Submit'
end

Then(/^their choice should be stored as declined$/) do
  @proposal.reload
  expect(@proposal.status).to eq(2)
end
