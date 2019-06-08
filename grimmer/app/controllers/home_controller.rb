class HomeController < ApplicationController
  respond_to :json, :js, :html



  def index
    @posts = Post.all.reverse
  end

  def create


    @post = Post.create(user_id: session["warden.user.user.key"][0][0],title: params[:title],description:params[:description],visibility: params[:public],
                        status: true,city:"Santiago", country: "Chile" )#despues lo seteo con  el current user

    if params[:attachments]
    @p = PostAttachment.create(post: @post, avatars: params[:attachments][:attachment])

    if @post.save!
      redirect_to root_path
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

  def report
    @post = Post.find(params[:id])
    @post_report = PostReport.new
    respond_to do |format|
      format.js
      end
  end
  def follow
    @post = Post.find(params[:id])
    @post_follow = PostShare.create(post_id: @post.id,user_id: session["warden.user.user.key"][0][0])



  end
  def comment
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.create(post_id: @post.id,user_id: session["warden.user.user.key"][0][0], comment: params[:comment])
    respond_to do |format|
      format.js
    end



  end


  def attachments=(files = [])
    attachments.create(attachment: f)
  end


  def edit
    @post = Post.find(params[:id])


  end

  def delete_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: request.referer)
  end

  def delete
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end






end

