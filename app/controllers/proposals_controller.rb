class ProposalsController < ApplicationController

  before_filter :associated_project, :only => [:new, :show, :edit, :update]
  before_filter :find_proposal, :only => [:show, :edit, :update]

  def new
    @proposal = Proposal.new( :creative_id => current_user.id )
  end

  def create
    @proposal = Proposal.new(params_for_proposal)
    @proposal.project_id = params["project_id"]

    if @proposal.save
      flash[:notice] = "Your proposal has been saved"
      redirect_to projects_path
    else 
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if  @proposal.update(params_for_proposal)
      flash[:notice] = "Your proposal has been saved"
      redirect_to project_path(@project)
    else
      render :show
    end
  end

  def params_for_proposal
    params.require(:proposal).permit(:title, :description, :about, :creative_id, :project_id, :status)
  end

  def associated_project
    @project = Project.find(params[:project_id])
  end

  def find_proposal
    @proposal = Proposal.find(params[:id])
  end

end
