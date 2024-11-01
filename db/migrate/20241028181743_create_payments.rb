class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.references :rental, null: false, foreign_key: true
      t.decimal :amount
      t.date :payment_date
      t.string :payment_method
      t.string :status

      t.timestamps
    end
  end
end
