class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :stylist

  # checks for empty fields
  def self.valid_params?(params,attributes=[:date, :start, :finish])
    note = attributes.reduce([]) do |note,symbol|
      note << !params[symbol].empty?
    end
    note.all? { |n| n == true }
  end

  def date_string
    date.split(' ')[0]
  end

  def start_string
    start.to_s.split(' ')[1]
  end

  def finish_string
    finish.to_s.split(' ')[1]
  end
end
