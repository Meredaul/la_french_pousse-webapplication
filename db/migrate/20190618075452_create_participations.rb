class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.references :user, foreign_key: true
      t.references :pouss, polymorphic: true
      t.boolean :admin
      t.string :statut

      t.timestamps
    end
  end
end
