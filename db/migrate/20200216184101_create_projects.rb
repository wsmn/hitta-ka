class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
