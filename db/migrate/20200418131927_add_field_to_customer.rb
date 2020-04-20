class AddFieldToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column(:customers, :phone, :string)
    add_column(:customers, :email, :string)
    add_column(:customers, :settings, :jsonb, null: false, default: {})
  end
end
