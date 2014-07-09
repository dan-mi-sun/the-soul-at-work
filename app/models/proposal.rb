class Proposal < ActiveRecord::Base

  validates_length_of :title, :minimum => 4, :allow_blank => false  
  validates_length_of :description, :minimum => 10, :allow_blank => false 
  validates_length_of :about, :minimum => 10, :allow_blank => false 

  belongs_to :creative
  belongs_to :project

  after_save :send_confirmation, if: proc { |proposal| changes.include?(:status)  && proposal.changes["status"][1] == 1 }

  def send_confirmation 
    @client = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN

    @client.account.messages.create(
      :from => '+442393162418',
      :to => '+447442808919',
      :body => "Your proposal has been accepted" 
    )
  end

  after_save :debit_card, if: proc { |proposal| changes.include?(:status) && proposal.changes["status"][1] == 1 }

  def debit_card
    card = Balanced::Card.fetch(project.buyer.balanced_card_uri)
    begin
      @debit = card.debit(
        :amount => (10 * 100).to_i,
        :appears_on_statement_as => "Charged for Book",
        :description => "Charged for Book"
      )
    rescue Balanced::Error => ex 
      render :js => "window.location.href='"+root_path+"'" 
      flash[:alert] = ex.message.split("card-declined: ")[1].split(" --")[0] unless ex.nil?
    end
  end

end
