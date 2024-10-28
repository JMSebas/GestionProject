class CreateDamages < ActiveRecord::Migration[7.2]
  def change
    create_table :damages do |t|
      t.references :rental, null: false, foreign_key: true
      t.text :description
      t.decimal :repair_cost
      t.string :status
      t.datetime :report_date

      t.timestamps
    end
  end
end
