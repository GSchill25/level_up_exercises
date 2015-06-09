class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	
  def new
  end

  def edit
  end

  def show
  end

  def rails_update
    current_user.version_change if GemVersion.current_rails_version
    redirect_to user_path(current_user), notice: "Rails Version Updated"
  end

  def ruby_update
    current_user.version_change if GemVersion.current_ruby_version
    redirect_to user_path(current_user), notice: "Ruby Version Updated"
  end

  private
    def set_user
    	@user = User.find(params[:id])
    end
end
