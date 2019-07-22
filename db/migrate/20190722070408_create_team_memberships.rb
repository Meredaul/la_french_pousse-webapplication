class CreateTeamMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :team_memberships do |t|
      t.references :user, foreign_key: true
      t.references :pouss, polymorphic: true

      t.timestamps
    end
  end
end
