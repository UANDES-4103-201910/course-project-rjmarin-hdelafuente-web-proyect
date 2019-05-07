class HomeController < ApplicationController

  def show
    @posts = Post.all

  end
  def index
    @posts = Post.all

  end

end

