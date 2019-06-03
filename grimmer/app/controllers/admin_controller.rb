class AdminController < ApplicationController
  def show
    dumpster = Dumpster.select("post_id").all
    @dumpster_posts = []
    for post_id in dumpster
      post = Post.find_by(id: post_id.post_id)
      @dumpster_posts.push(post)
    end
    @all_users = User.all
    ids_in_blacklist = Blacklist.select("user_id").all
    @blacklist = []
    for user_id in ids_in_blacklist
      @blacklist.push(User.find(id: user_id))
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show_post
    @post = Post.find(params[:id])
  end
end
