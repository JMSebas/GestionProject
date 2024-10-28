class CreateRentals < ActiveRecord::Migration[7.2]
  def change
    create_table :rentals do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :actual_start_date
      t.datetime :expected_return_date
      t.datetime :actual_return_date
      t.integer :initial_odometer
      t.integer :final_odometer
      t.string :status

      t.timestamps
    end
  end
end
