class AddValidatedToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :validated, :boolean
  end
end
