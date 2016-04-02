class AddStylistIdToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :stylist_id, :integer
  end
end
