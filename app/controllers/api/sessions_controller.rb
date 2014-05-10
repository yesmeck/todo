class Api::SessionsController < ApplicationController
  respond_to :json

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in_as @user
      respond_with @user
    else
      render json: ['Incorret password'], status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
