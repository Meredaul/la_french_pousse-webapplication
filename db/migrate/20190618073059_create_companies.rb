class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :nom
      t.string :presentation
      t.string :photo
      t.string :email
      t.string :adresse
      t.float :latitude
      t.float :longitude
      t.integer :compteur_passage

      t.timestamps
    end
  end
end
