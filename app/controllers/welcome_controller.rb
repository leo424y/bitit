class WelcomeController < ApplicationController
  def index
   flash[:alert] = "早安！你壞！"
   flash[:notice] = "早安！你好！"
   flash[:warning] = "早安！你普！"
  end
end
