class PostsController < ApplicationController
 before_action :authenticate_user!
 before_action :find_group
 before_action :find_post, only: [:edit, :update, :destroy]

 def new
   @group = Group.find(params[:group_id])
   @post = @group.posts.new
 end

 def create
   @post = @group.posts.build(post_params)
   @post.author = current_user

   if @post.save
     redirect_to group_path(@group), notice: "新增挑戰行動成功！"
   else
     render :new
   end
 end

 def edit
 end

 def update
    if @post.update(post_params)
      redirect_to group_path(@group), notice: "挑戰行動號角再度響起！"
    else
      render :edit
    end
 end

 def destroy
    @post.destroy
    redirect_to group_path(@group), alert: "挑戰行動已經告吹"
 end

 private

 def find_group
   @group = Group.find(params[:group_id])
 end

 def find_post
   @post = current_user.posts.find(params[:id])
 end

 def post_params
   params.require(:post).permit(:content)
 end
end
