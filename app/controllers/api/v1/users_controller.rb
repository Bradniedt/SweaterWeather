class Api::V1::UsersController < ApplicationController
  def create
    key = SecureRandom.base64
    user = User.create!(email: params["email"], password: params["password"], api_key: key)
    render json: ApiSerializer.new(user)
  end

  private

  def user_params
      params.require(:user).permit(:email, :password)
  end
end
