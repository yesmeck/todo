class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in_as @user
      redirect_to root_path
    else
      redirect_to sign_in_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
