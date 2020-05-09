class AddFieldsToOrganisation < ActiveRecord::Migration[6.0]
  def change
    add_column(:organisations, :address, :jsonb, null: false, default: {})
    add_column(:organisations, :settings, :jsonb, null: false, default: {})
    add_column(:organisations, :phone, :string, null: false, default: "")
    add_column(:organisations, :email, :string, null: false, default: "")
    add_column(:organisations, :website, :string, null: false, default: "")
  end
end
