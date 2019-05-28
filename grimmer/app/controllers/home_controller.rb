class HomeController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def create


    @post = Post.create(user_id: 1,title: params[:title],description:params[:description],visibility: params[:public],
                        status: true,city:"Santiago", country: "Chile" )#despues lo seteo con  el current user
    if @post.save!
      puts @post
    end
    @p = PostAttachment.create(post: @post, avatars: params[:attachments][:attachment])


    if @p.save!
      puts @p.avatars[0].identifier
      puts @p.avatars[0].url
    end
    redirect_to "/home"
  end


  def images=(files = [])
    attachments.create(image: f)
  end
  def attachments=(files = [])
    attachments.create(attachment: f)
  end

end

