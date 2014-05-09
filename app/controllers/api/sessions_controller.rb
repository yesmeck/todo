class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in_as @user
    end
    render nothing: true
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
