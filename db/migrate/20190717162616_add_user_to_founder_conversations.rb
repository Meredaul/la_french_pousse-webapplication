class AddUserToFounderConversations < ActiveRecord::Migration[5.2]
  def change
    add_reference :founder_conversations, :user, foreign_key: true
  end
end
