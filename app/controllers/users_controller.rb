class UsersController < ApplicationController
  
  def main
  end


  def create
  	user = User.new(user_params)
  	if user.save 
  		session[:user_id] = user.id
  		redirect_to '/groups'
  	else
  		flash[:register_errors] = user.errors.full_messages
  		redirect_to '/'
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
