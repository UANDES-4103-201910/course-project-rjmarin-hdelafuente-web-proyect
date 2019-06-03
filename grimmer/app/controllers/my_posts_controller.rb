class MyPostsController < ApplicationController
  def index
    @posts = Post.where("user_id = ?", session["warden.user.user.key"][0][0]).reverse
  end
end
