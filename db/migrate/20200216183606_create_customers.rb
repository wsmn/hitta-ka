class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.references :organisation, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
