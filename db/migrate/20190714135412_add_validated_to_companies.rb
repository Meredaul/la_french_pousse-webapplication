class AddValidatedToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :validated?, :boolean
  end
end
