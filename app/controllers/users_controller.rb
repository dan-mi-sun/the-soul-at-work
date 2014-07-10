class UsersController < ApplicationController
  before_action :authenticate_user!

  before_filter :assign_current_user, :only => [:me, :edit, :update]
  before_filter :all_projects, :only => [:me, :show]

  def me
    render :template => "users/#{current_user.type.downcase}"
  end

  def show
    @user = User.find(params[:id])
    render :template => "users/#{current_user.type.downcase}"
  end

  def edit 
    @languages = Language.all
    @skills = Skill.all
  end

  def update
    @user.update(allowed_params)
    redirect_to me_user_path
  end

  private
  def allowed_params
    params.require(:user).permit(:first_name, :last_name, :address, :username, :type, :birthday, :location, :about, :avatar, :language_ids => [], :skill_ids => [] )
  end

  def assign_current_user
    @user = current_user
  end

  def all_projects
    @projects = Project.all
  end
end
