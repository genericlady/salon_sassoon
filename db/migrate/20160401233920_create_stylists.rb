class CreateStylists < ActiveRecord::Migration
  def change
    create_table :stylists do |t|
      t.string :name
    end
  end
end
