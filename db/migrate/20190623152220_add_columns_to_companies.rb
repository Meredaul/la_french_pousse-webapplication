class AddColumnsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :category_id, :string
  end
end
