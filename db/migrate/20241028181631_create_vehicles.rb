class CreateVehicles < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :model
      t.string :license_plate
      t.integer :year
      t.string :type
      t.string :status
      t.decimal :daily_rate

      t.timestamps
    end
  end
end
