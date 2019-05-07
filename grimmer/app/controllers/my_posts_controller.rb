class MyPostsController < ApplicationController
  def index
    @posts = Post.where("user_id = ?", 1) #hay que sacar la credencial por el login
  end
end
