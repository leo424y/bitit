class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :find_group, only: [:show, :edit, :update, :join, :quit, :fork]
  before_action :find_group_current_user, only: [:edit, :update, :destroy]

  def index
    @groups = Group.includes(:posts).recent
    @groups = @groups.page(params[:page]).per(7)
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
      redirect_to groups_path, notice: "造字更新成功"
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, alert: "造字已煙消雲散"
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      current_user.join!(@group)
      redirect_to groups_path, notice: "造字已召告天下!"
    else
      render :new
    end
  end

# fork功能，可發展別人的字
  def createano
    if current_user
      @group = current_user.groups.new(group_params)
    else
      @group = Group.new(group_params)
    end
    if @group.save
      redirect_to groups_path, notice: "舊字已新告天下!"
    else
      render :fork
    end
  end

  def fork
  end

  def join
    if !current_user.is_member_of?(@group)
      current_user.join!(@group)
      flash[:notice] = "你已開始信此字"
    else
      flash[:warning] = "你早已是此字信眾"
    end
    redirect_to group_path(@group)
  end

  def quit
    if current_user.is_member_of?(@group)
      current_user.quit!(@group)
      flash[:alert] = "你已不信此字"
    else
      flash[:warning] = "你不是本字信眾"
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
    params.require(:group).permit(:title, :description, :font)
  end
end
