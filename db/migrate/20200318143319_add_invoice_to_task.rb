class AddInvoiceToTask < ActiveRecord::Migration[6.0]
  def change
    add_reference(:tasks, :invoice, foreign_key: true, null: true)
  end
end
