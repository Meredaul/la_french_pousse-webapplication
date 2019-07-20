class ChangePreuveTypeInCompanies < ActiveRecord::Migration[5.2]
  def change
    change_column :companies, :preuve, :string
  end
end
