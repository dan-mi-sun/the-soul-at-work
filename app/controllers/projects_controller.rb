class ProjectsController < ApplicationController

  def new
    @project = Project.new
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

  def update
  end

  private
  def params_for_project
    params.require(:project).permit(:title, :description, :about, :closing_date)
  end

end
