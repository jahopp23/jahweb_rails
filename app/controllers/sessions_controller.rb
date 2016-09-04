class SessionsController < ApplicationController

  def login
  	@user = User.find_by_email(params[:user][:email])
  	if @user && @user.authenticate(params[:user][:password])
  		session[:user_id] = @user.id
  		redirect_to '/groups'
  	else
  		flash[:login_errors] = ["Invalid email/password"]
  		redirect_to '/'
  	end
  end

  def logout
  	session[:user_id] = nil
  	redirect_to '/'
  end

end
