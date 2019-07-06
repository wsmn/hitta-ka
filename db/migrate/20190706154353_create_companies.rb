class CreateCompanies < ActiveRecord::Migration[5.2]

  def change
    enable_extension("pgcrypto") unless extension_enabled?("pgcrypto")
    create_table :companies, id: :uuid, default: "gen_random_uuid()" do |t|
      t.string :name, null: false, index: true
      t.string :slug, index: true, unique: true
      t.jsonb :address, null: false, default: '{}'
      t.decimal :latitude, index: true
      t.decimal :longitude, index: true

      t.timestamps
    end
  end
end
