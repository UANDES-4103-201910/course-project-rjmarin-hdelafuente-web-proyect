class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    puts params
    ###
    # 
  end

end

