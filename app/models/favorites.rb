class Favorites < ApplicationRecord
  class User < ApplicationRecord
    validates_presence_of :location, :current_weather

    belongs_to :user
end
