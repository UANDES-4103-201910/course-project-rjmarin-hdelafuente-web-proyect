class HomeController < ApplicationController
  def index
    @posts = Post.all.reverse#.last(10)
  end

  def create


    @post = Post.create(user_id: session["warden.user.user.key"][0][0],title: params[:title],description:params[:description],visibility: params[:public],
                        status: true,city:"Santiago", country: "Chile" )#despues lo seteo con  el current user
    if @post.save!
      puts @post
    end
    if params[:attachments]
    @p = PostAttachment.create(post: @post, avatars: params[:attachments][:attachment])

    if @p.save!
      redirect_to "/home"
    end
    flash[:error] = "error to create a post"
    end

  end

  def like
    @post = Post.find(params[:id])
    @post_vote = PostVote.create(post_id: @post.id,user_id: session["warden.user.user.key"][0][0], vote: true)
    if request.xhr?

      render json: { count: PostVote.where("post_id = ? AND vote = ?",@post.id,true).count, id: params[:id] }
    else
      redirect_to "/home"

    end
  end

    def like
      @post = Post.find(params[:id])
      @post_vote = PostVote.create(post_id: @post.id,user_id: session["warden.user.user.key"][0][0], vote: false)
      if request.xhr?
        render json: { count:PostVote.where("post_id = ? AND vote = ?",post.id,false).count , id: params[:id] }
      else
        redirect_to "/home"

      end
    end


  def attachments=(files = [])
    attachments.create(attachment: f)
  end

end

