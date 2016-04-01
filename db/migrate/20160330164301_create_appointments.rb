class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :date
      t.datetime :start
      t.datetime :finish
      # t.belongs_to :user, index: true
      # t.belongs_to :employee, index: true
    end
  end
end
