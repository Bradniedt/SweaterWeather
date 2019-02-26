class Api::V1::FavoritesController < ApplicationController
  def create
    binding.pry
    user = User.find_by(api_key: params["api_key"])
    if user
      user.create_favorite(params["location"])
      render json: {}, status: 201
    else
      render json: {}, status: 401
    end
  end
end