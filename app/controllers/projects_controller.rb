class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    Project.create(params_for_project)
    redirect_to root_path
  end

  def update
  end

  private
  def params_for_project
    params.require(:project).permit(:title, :description, :about, :closing_date)
  end

end
