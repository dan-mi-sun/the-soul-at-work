class UsersController < ApplicationController
  before_action :authenticate_user!

  def me
    @user = current_user
    render :show
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
    params.require(:user).permit(:username, :type, :birthday, :location, :about, :avatar,
                                :language_ids => [], :skill_ids => [] )
  end
end
