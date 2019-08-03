class AddColumnsToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :major_publication, :boolean
    add_column :publications, :visible, :boolean
  end
end
