class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index

  end

  def current_user
    id = cookies["user_id"]
    user = User.find(id.to_i)
    flash[:notice] = "WELCOME" + user.name
    redirect_to "/home/"

  end

  def is_user_logged_in?
    #complete this method
    logged_in = false
    id = cookies["user_id"]
    user = User.find(id.to_i)
    if user
      logged_in = true
    end
    if logged_in then true else redirect_to root_path end
  end
end


