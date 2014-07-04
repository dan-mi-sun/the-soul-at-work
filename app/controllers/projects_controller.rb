class ProjectsController < ApplicationController

  def new
    @project = Project.new
    @skills = Skill.all
  end

  def create
    @project = Project.new(params_for_project)
    if @project.save
      flash[:notice] = "Your project has been saved"
      redirect_to new_project_path
    else 
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
    @skills = Skill.all
  end

  def update
    @project = Project.find(params[:id])
    @project.update(params_for_project)
    redirect_to root_path
  end

  private
  def params_for_project
    params.require(:project).permit(:title, :description, :about, :closing_date, :skill_ids => [] )
  end

end
