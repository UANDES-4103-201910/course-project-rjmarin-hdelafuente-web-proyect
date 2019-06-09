class SearchController < ApplicationController
  def show
    if params[:search].blank?
      redirect_to(root_path, alert: "Search field empty!")
    else
      @users = User.where(["name or city LIKE ?", "%#{params[:search]}%"])
      @posts = Post.where(["title or description LIKE ?", "%#{params[:search]}%"] )
    end
  end
end
