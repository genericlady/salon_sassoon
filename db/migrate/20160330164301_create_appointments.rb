class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :date
      t.datetime :start
      t.datetime :finish
    end
  end
end
