class CreateInvoices < ActiveRecord::Migration[7.2]
  def change
    create_table :invoices do |t|
      t.references :rental, null: false, foreign_key: true
      t.decimal :total_amount
      t.datetime :issue_date
      t.date :due_date
      t.string :status

      t.timestamps
    end
  end
end
