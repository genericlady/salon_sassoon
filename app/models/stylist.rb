class Stylist < ActiveRecord::Base
  has_many :appointments
  has_many :users, through: :appointments

  def self.valid_params?(params)
    !params[:name].empty?
  end
end
