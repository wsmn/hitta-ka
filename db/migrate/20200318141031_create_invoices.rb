class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.references :customer, null: false, foreign_key: true
      t.date :invoice_date, null: false, default: -> { "CURRENT_DATE" }
      t.date :due_date
      t.string :invoice_nbr
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
