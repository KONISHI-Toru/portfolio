module SessionsHelper

  def log_in(user)
    session[:user] = user
  end

  def log_out
    session.delete(:user)
  end

  def current_user
    session[:user]
  end

  def logged_in?
    !current_user.nil?
  end
end
