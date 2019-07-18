class CreateFounderConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :founder_conversations do |t|
      t.string :name
      t.timestamps
    end
  end
end
