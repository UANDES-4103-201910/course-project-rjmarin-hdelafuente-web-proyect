class AdminController < ApplicationController
  def show
    dumpster = Dumpster.select("post_id").all
    @dumpster_posts = []
    for post_id in dumpster
      @dumpster_posts.push(Post.where("id = ?", post_id))
    end
    @all_users = User.all
    ids_in_blacklist = Blacklist.select("user_id").all
    @blacklist = []
    for user_id in ids_in_blacklist
      @blacklist.push(User.where("id = ?", user_id))
    end
  end

  def edit
    @user = User.find(params[:id])
  end
end
