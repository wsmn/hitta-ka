class AddFieldsToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column(:customers, :address, :jsonb, null: false, default: {})
    add_column(:customers, :contact_information, :jsonb, null: false, default: {})
  end
end
