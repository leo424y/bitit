class PostsController < ApplicationController
 def new
   @group = Group.find(params[:group_id])
   @post = @group.posts.new
 end

 def create
   @group = Group.find(params[:group_id])
   @post = @group.posts.build(post_params)

   if @post.save
     redirect_to group_path(@group), notice: "新增挑戰行動成功！"
   else
     render :new
   end
 end

 def edit
    @gruop = Group.find(params[:group_id])
    @post = @group.post.find(params[:id])
 end

 def destroy
    @group = Group.find(params[:group_id])
    @post = @group.posts.find(params[:id])

    @post.destroy
    redirect_to group_path(@group), alert: "挑戰行動已經告吹"
 end

 private

 def post_params
   params.require(:post).permit(:content)
 end
end
