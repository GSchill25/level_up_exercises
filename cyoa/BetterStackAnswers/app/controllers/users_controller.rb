class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	
  def new
  end

  def edit
  end

  def show
  end

  def create
  end

  def update
  end

  private
    def set_user
    	@user = User.find(params[:id])
    end

    def user_params
    	params.require(:user).permit(:name, :email, :revisions, :uid, :provider, :picture)
    end
end
