class Favorite < ApplicationRecord
    validates_presence_of :location, :current_weather

    belongs_to :user
end
