class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params["api_key"])
    if user
      user.favorites.create!(params["location"])
      render json: {}, status: 201
    else
      render json: {}, status: 401
    end
  end
end
