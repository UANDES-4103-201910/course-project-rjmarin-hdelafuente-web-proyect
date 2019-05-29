class HomeController < ApplicationController
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


  def images=(files = [])
    attachments.create(image: f)
  end
  def attachments=(files = [])
    attachments.create(attachment: f)
  end

end

