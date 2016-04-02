class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :stylist

  def self.valid_params?(params)
    !params[:start].empty? && !params[:finish] && !params[:date]
  end
end
