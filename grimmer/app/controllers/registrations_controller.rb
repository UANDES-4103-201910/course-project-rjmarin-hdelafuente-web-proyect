class RegistrationsController < ApplicationController
  def create

    if params["username_in"] !=""
    user = User.where(email: params[:username_in]).first
    if user  && user.password == params[:password_in]
      cookies["user_id"] = String(user.id)
      flash[:notice] = "login is sussesfully"
      redirect_to "/home"
    else
      flash[:error] = 'error email or password are incorrect'
      redirect_to root_path
    end
    else
    @user = User.create(email: params[:email],
                        password:params[:password])
    @user_profile = UserProfile.create(user_id:@user.id,name:params[:name],
                                       last_name: params[last_name],
                                       country:params[:country],
                                       city:params[:city])


    if @user_profile.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
      end
    else
      flash[:error] = "couldn't create the user"
      redirect_to sign_in
    end


    end
  end

  def destroy
    cookies["user_id"] = ""
  end
end
