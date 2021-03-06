class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params["email"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
    end
    render json: ApiSerializer.new(user)
  end
end
