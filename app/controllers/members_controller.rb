class MembersController < ApplicationController
  before_action :require_login, execpt: [:index]
  
  def index
  end

  def create
    @group = Group.find(params[:group_id])
    @member = Member.create(user: current_user, group: Group.find(params[:group_id]))
    redirect_to "/groups/#{@group.id}"
  end

  def destroy
    @group = Group.find(params[:group_id])
    @member = Member.find_by(user: current_user, group: Group.find(params[:group_id])).destroy
    redirect_to "/groups/#{@group.id}"
  end
end
