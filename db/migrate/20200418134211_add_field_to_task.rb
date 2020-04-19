class AddFieldToTask < ActiveRecord::Migration[6.0]
  def change
    add_column(:tasks, :settings, :jsonb, null: false, default: {})
    add_column(:tasks, :task_date, :date)
  end
end
