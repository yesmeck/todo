class Api::UsersController < ApplicationController
  respond_to :json

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in_as @user
    end
    render nothing: true
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
