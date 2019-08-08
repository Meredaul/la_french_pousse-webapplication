class CreatePoussePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :pousse_publications do |t|

      t.timestamps
    end
  end
end
