class HomeController < ApplicationController
  respond_to :json, :js, :html



  def index
    @posts = Post.all.reverse
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
    liked = PostVote.where("post_id = ? AND user_id = ? AND vote = ?"  , @post.id,session["warden.user.user.key"][0][0], true)
    puts liked
    if liked.size == 0
    @post_vote = PostVote.create(post_id: @post.id,user_id: session["warden.user.user.key"][0][0], vote: true)
    respond_to do |format|
      format.js #{render json: { id: params[:id] },content_type:'text/json'}
    end
    end


  end

  def dislike
    @post = Post.find(params[:id])
    liked = PostVote.where("post_id = ? AND user_id = ? AND vote = ?"  , @post.id,session["warden.user.user.key"][0][0], false)
    puts liked
    if liked.size == 0
      @post_vote = PostVote.create(post_id: @post.id,user_id: session["warden.user.user.key"][0][0], vote: false)
      respond_to do |format|
        format.js #{render json: { id: params[:id] },content_type:'text/json'}
      end
    end
  end


  def attachments=(files = [])
    attachments.create(attachment: f)
  end

end

