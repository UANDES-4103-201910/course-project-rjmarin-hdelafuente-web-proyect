class SessionsController < ApplicationController
  def create
    user = User.where(email: params[:session][:email]).first
    if user  && user.password == params[:session][:password]
      cookies["user_id"] = String(user.id)
      flash[:notice] = "login is sussesfully"
      redirect_to "/users/" + String(user.id)
    else
      flash[:error] = 'error email or password are incorrect'
      redirect_to root_path
    end



  end

  def destroy
    cookies["user_id"] = ""
  end
end


