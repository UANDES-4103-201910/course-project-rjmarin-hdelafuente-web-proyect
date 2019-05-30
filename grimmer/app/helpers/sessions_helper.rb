module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:current_user_id] = user.id
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:current_user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the current logged-in user (if any).
  def current_user
    if (user_id = session[:current_user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:current_user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session["warden.user.user.key"][0][0] = 0
    forget(current_user)
    session.delete(:current_user_id)
    @current_user = session[:current_user_id] = nil
  end

  def forget(user)
    #user.forget
    cookies.delete(:current_user_id)
    cookies.delete(:remember_token)
  end

end
