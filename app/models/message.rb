class Message < ApplicationRecord
  after_create :broadcast_message

  acts_as_readable on: :created_at

  belongs_to :founder_conversation
  belongs_to :user
  validates :content, presence: true, allow_blank: false

  def from?(some_user)
    user == some_user
  end

  def broadcast_message
    ActionCable.server.broadcast("founder_conversation_#{founder_conversation.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "messages/message",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: user.id
    })
  end
end
