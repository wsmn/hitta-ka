class MakeCompaniesUnique < ActiveRecord::Migration[6.0]
  def change
    remove_index(:companies, :slug)
    add_index(:companies, :slug, unique: true)
  end
end
