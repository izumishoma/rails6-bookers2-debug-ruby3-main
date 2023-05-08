class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  
  def new
    @group = Group.new
    @group.users << current_user
  end
  
  def index
    @groups = Group.all
  end
  
  def show
    @group = Group.find(params[:id])
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end
  
  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  private
  
  def group_params
    params.require(:group).permit(:name, user_ids: [] )
  end
  
  def set_group
    @group = Group.find(params[:id])
  end
end