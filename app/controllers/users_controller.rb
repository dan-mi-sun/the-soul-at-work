class UsersController < ApplicationController
  before_action :authenticate_user!

  def me
    @user = current_user
    @projects = Project.all
    render :template => "users/#{current_user.type.downcase}"
  end

  def show
    @user = User.find(params[:id])
    @projects = Project.all
    render :template => "users/#{current_user.type.downcase}"
  end

  def edit 
    @user = current_user
    @languages = Language.all
    @skills = Skill.all
  end

  def update
    @user = current_user
    @user.update(allowed_params)
    redirect_to me_user_path
  end

  private
  def allowed_params
    params.require(:user).permit(:first_name, :last_name, :address, :username, :type, :birthday, :location, :about, :avatar, :language_ids => [], :skill_ids => [] )
  end
end
