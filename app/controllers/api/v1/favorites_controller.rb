class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params["api_key"])
    if user
      user.favorites.create!(location: params["location"])
    else
      render json: {}, status: 401
    end
  end

  def index
    user = User.find_by(api_key: params["api_key"])
    if user && !user.favorites.empty?
      favorites = FavoritePresenter.new(user.favorites)
      render json: FavoriteSerializer.new(favorites)
    else
      render json: {}, status: 401
    end
  end

  def destroy
    user = User.includes(:favorites).find_by(api_key: params["api_key"])
    if user && !user.favorites.empty?
      fave = user.favorites.find_by(location: params["location"])
      favorite = FavoritePresenter.new(fave, "delete")
      render json: FavoriteSerializer.new(favorite), status: 201
    else
      render json: {}, status: 401
    end
  end

end
