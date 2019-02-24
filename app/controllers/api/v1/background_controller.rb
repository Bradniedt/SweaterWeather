class Api::V1::BackgroundController < ApplicationController
  def index
    photo = Photo.get_url(params[:location])
    render json: PhotoSerializer.new(photo)
  end
end
