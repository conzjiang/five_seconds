class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_credentials(user_params[:email], user_params[:password])

    if user
      sign_in!(user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Incorrect email/password."]
      @user = User.new(user_params)
      render :new
    end
  end

  def destroy
    sign_out!
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end