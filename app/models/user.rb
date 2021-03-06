class User < ApplicationRecord
  validates_presence_of :email, :password, :api_key
  validates_uniqueness_of :email
  validates_uniqueness_of :api_key

  has_many :favorites

  has_secure_password
end
