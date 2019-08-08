class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.references :user, foreign_key: true
      t.references :pouss, polymorphic: true
      # t.references :pousse_publication, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
