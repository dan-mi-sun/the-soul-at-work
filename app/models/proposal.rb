class Proposal < ActiveRecord::Base

  validates_length_of :title, :minimum => 4, :allow_blank => false  
  validates_length_of :description, :minimum => 10, :allow_blank => false 
  validates_length_of :about, :minimum => 10, :allow_blank => false 

  belongs_to :creative
  belongs_to :project

  after_save :send_confirmation, if: proc { |proposal| proposal.changes["status"][1] == 1 }

  def send_confirmation 
    @client = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN

    @client.account.messages.create(
      :from => '+442393162418',
      :to => '+447442808919',
      :body => "Your proposal has been accepted" 
    )
  end

  def reject

  end

end
