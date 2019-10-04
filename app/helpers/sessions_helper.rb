module SessionsHelper

  def log_in(user)
    #session[:user_id] = user.id
    session[:user] = user

    @current_user = user
  end

  def log_out
    session.delete(:user)
    @current_user = nil
  end

  def current_user
    @current_user = session[:user]
  end

  def logged_in?
    !current_user.nil?
  end
end
