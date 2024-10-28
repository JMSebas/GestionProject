class CreateMaintenances < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenances do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :description
      t.decimal :cost
      t.string :status

      t.timestamps
    end
  end
end
