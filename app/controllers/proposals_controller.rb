class ProposalsController < ApplicationController

  def new
    @proposal = Proposal.new(:creative_id => current_user.id)
  end

  def create
    @proposal = Proposal.new(params_for_proposal)
    if @proposal.save
      flash[:notice] = "Your proposal has been saved"
      redirect_to projects_path
    else 
      render :new
    end
  end

  def params_for_proposal
    params.require(:proposal).permit(:title, :description, :about, :creative_id, :project_id)
  end

end