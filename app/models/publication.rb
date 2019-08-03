class Publication < ApplicationRecord
  # after_create :broadcast_publication

  belongs_to :user
  belongs_to :pouss, polymorphic: true
  validates :content, presence: true, allow_blank: false

  def from?(some_user)
    user == some_user
  end

  def broadcast_publication
    ActionCable.server.broadcast("founder_conversation_#{founder_conversation.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "messages/message",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: user.id
    })
  end
end
