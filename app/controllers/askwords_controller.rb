class AskwordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :find_askword, only: [:show, :edit, :update]
  before_action :find_askword_current_user, only: [:edit, :update, :destroy]


  def index
    @askwords = Askword.all.recent
  end

  def new
    @askword = Askword.new
  end

  # def show
  #   @posts = @askword.posts.recent
  # end

  def edit
  end

  def update
    if @askword.update(askword_params)
      redirect_to askwords_path, notice: "求字更新成功"
    else
      render :edit
    end
  end

  def destroy
    @askword.destroy
    redirect_to askwords_path, alert: "已取消求字"
  end

  def create
    @askword = current_user.askwords.new(askword_params)

    if @askword.save
      redirect_to askwords_path, notice: "求字已召告天下!"
    else
      render :new
    end
  end

  private
  def find_askword
    @askword = Askword.find(params[:id])
  end

  def find_askword_current_user
    @askword = current_user.askwords.find(params[:id])
  end

  def askword_params
    params.require(:askword).permit(:title, :description)
  end
end
