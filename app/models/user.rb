class User < ActiveRecord::Base
  # one way hashing algorithm
  has_secure_password
  has_many :appointments
  # has_many :stylists, through: :appointments
end
