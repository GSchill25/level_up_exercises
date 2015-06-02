class SessionsController < ApplicationController
	def new
	end

  def create
  	auth_hash = request.env['omniauth.auth']
  	puts auth_hash
  	@user = User.find_or_create(auth_hash)
  	session[:user_id] = @user.id
  	redirect_to questions_url
  end

  def destroy
  	session[:user_id] = nil
    redirect_to questions_url, notice: "You have been logged out."
  end
end
