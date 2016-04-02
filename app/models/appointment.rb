class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :stylist

  def self.valid_params?(params)
    !params[:date].empty? && !params[:start].empty? && !params[:finish].empty?
  end
end
