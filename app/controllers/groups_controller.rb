class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :find_group, only: [:show, :edit, :update, :join, :quit]
  before_action :find_group_current_user, only: [:edit, :update, :destroy]


  def index
    @groups = Group.includes(:posts).order("posts_count DESC")
  end

  def new
    @group = Group.new
  end

  def show
    @posts = @group.posts.recent
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: "挑戰更新成功"
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, alert: "挑戰已煙消雲散"
  end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      current_user.join!(@group)
      redirect_to groups_path, notice: "挑戰已召告天下!"
    else
      render :new
    end
  end

  def join
    if !current_user.is_member_of?(@group)
      current_user.join!(@group)
      flash[:notice] = "你已入此戰！"
    else
      flash[:warning] = "你已經是戰員了！"
    end
    redirect_to group_path(@group)
  end

  def quit
    if current_user.is_member_of?(@group)
      current_user.quit!(@group)
      flash[:alert] = "已退出此戰！"
    else
      flash[:warning] = "你不是本戰成員"
    end
    redirect_to group_path(@group)
  end

  private



  def find_group
    @group = Group.find(params[:id])
  end

  def find_group_current_user
    @group = current_user.groups.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
