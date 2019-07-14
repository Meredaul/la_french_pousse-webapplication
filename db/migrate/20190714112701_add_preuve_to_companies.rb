class AddPreuveToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :preuve, :string
  end
end
