class CreateFaitPartis < ActiveRecord::Migration[5.2]
  def change
    create_table :fait_partis do |t|
      t.references :user, foreign_key: true
      t.references :pouss, foreign_key: true
      t.boolean :admin
      t.string :statut

      t.timestamps
    end
  end
end
