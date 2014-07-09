class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def new
    @project = Project.new(:buyer_id => current_user.id)
    @skills = Skill.all
  end

  def create
    @project = Project.new(params_for_project)
    if @project.save
      flash[:notice] = "Your project has been saved"
      redirect_to new_card_path
    else 
      @skills = Skill.all
      render :new
    end
  end

  def create_card
    # {"payment_response"=>{"cards"=>{"0"=>{"href"=>"/cards/CC1zTBYNIzSsbMURBGnW5Y5J", "id"=>"CC1zTBYNIzSsbMURBGnW5Y5J"}}, "status_code"=>"201"}}
    card = Balanced::Card.fetch(params[:payment_response][:cards].first[1][:href])
    buyer = current_user
    address = [] || buyer.address
 if card.is_verified == true
    current_user.update_attribute(:balanced_card_uri, card.href)
    # Adress object for balanced 
     unless buyer.address?
        street_address = card.address[:line1]
        city = card.address[:city]
        state = card.address[:state]
        country = "US"
        postal_code = card.address[:postal_code]
        address << "#{street_address},#{city},#{state},#{postal_code},#{country}"
        buyer.update_attribute(:address, address)
    end
    # Find or create balanced customer
    customer = buyer.find_or_create_balanced_customer(address)
    customer
    
    # Associate card
    if card.links[:customer] == nil # Check card's fetched instance for an associated customer
        card.associate_to_customer(customer.href)
    end
    
    begin
        @debit = card.debit(
            :amount => (10 * 100).to_i,
            :appears_on_statement_as => "Charged for Book",
            :description => "Charged for Book"
        )
        if @debit.status == "succeeded"
            render :js => "window.location.href='"+root_path+"'" 
            flash[:notice] = "Escrow was succesfully funded. "
        else
            render :js => "window.location.href='"+root_path+"'" 
            flash[:notice] = "Escrow was not succesfully funded. Please check your account details."
        end
    rescue Balanced::Error => ex 
        render :js => "window.location.href='"+root_path+"'" 
        flash[:alert] = ex.message.split("card-declined: ")[1].split(" --")[0] unless ex.nil?
    end
 end
end

  def new_card
  end  

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  def edit
    @project = Project.find(params[:id])
    @skills = Skill.all
  end

  def update
    @project = Project.find(params[:id])
    if  @project.update(params_for_project)
      flash[:notice] = "Your project has been saved"
      redirect_to new_project_path
    else
      @skills = Skill.all
      render :new
    end
  end

  private
  def params_for_project
    params.require(:project).permit(:title, :description, :about, :closing_date, :buyer_id, :skill_ids => [])
  end

end
