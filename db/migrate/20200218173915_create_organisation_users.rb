class CreateOrganisationUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :organisation_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :organisation, null: false, foreign_key: true
      t.index [:user_id, :organisation_id], unique: true

      t.timestamps
    end
  end
end
