class GroupsController < ApplicationController
	before_action :require_login, only: [:index, :about, :resume, :create, :destroy]
	
	def index
		@user = current_user
		@groups = Group.all
	end

	def about
       @user = current_user
	end

    def projects
       @user = current_user
    end
        
    def resume
    	@user = current_user
    end

    def contact
    	@user = current_user
    end

	def create
		user = current_user
		gparams = group_params
		gparams[:user] = user
		group = Group.new(group_params)
		group.user_id = user.id
		if group.save
			flash[:success] = "You have successfully create a new group!"
			redirect_to '/groups'
		else
			flash[:errors] = group.errors.full_messages
			redirect_to '/groups'
		end
	end

	def destroy
		group = Group.find(params[:group_id]).destroy
		redirect_to '/groups'
	end

	def show
		@group = Group.find(params[:id])
		@member = Member.all
	end

	private
	def group_params
		params.require(:group).permit(:name, :description, :link)
	end

end
