class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false, default: ""
      t.integer :status, null: false, default: 0
      t.float :hours, null: false, default: 0

      t.timestamps
    end
  end
end
