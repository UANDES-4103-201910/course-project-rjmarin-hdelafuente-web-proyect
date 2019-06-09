class AdminController < ApplicationController
  def show
    dumpster = Dumpster.select("post_id").all
    @dumpster_posts = []
    for post_id in dumpster
      post = Post.find_by(id: post_id.post_id)
      @dumpster_posts.push(post)
    end
    @all_users = User.all
    ids_in_blacklist = Blacklist.all
    @blacklist = []
    for bl in ids_in_blacklist
      row = []
      a = User.find_by(id: bl.user_id)
      row.push(a)
      row.push(bl.id)
      @blacklist.push(row)
    end

    @admins = []
    for user in @all_users
      if user.roles_mask != 1
        @admins.push(user)
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show_post
    @post = Post.find(params[:id])
  end
end
