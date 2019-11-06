class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    logger.debug(user.inspect)
    if user&.authenticate(session_params[:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  private
    # def set_user
    #   @user = User.find_by!(email: session_params[:email])
    # rescue
    #   flash.now[:danger] = t('.flash.invalid_mail')
    #   render action: 'new'
    # end

    # 許可するパラメータ
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
