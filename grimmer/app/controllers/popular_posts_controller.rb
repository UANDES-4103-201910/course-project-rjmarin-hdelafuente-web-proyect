class PopularPostsController < ApplicationController

  def index
    @posts = PostVote.where("vote", true).group("post_id").order("count_all DESC").count.take(7)
    puts(@posts)
  end
end
