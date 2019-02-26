class Location < ApplicationRecord
  validates_presence_of :city, :latitude, :longitude
end
