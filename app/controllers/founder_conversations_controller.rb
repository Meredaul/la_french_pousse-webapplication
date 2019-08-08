class FounderConversationsController < ApplicationController
  before_action :set_founder_conversation_id, only: [:update]

  def show
    # @founder_conversation = FounderConversation.includes(messages: :user).find(params[:id])
  end

  def index
    @unread_messages = Message.unread_by(User.find_by(admin: true)).uniq(&:founder_conversation)
    @unread_conversations = @unread_messages.map(&:founder_conversation)
    @admin_user = User.find_by(admin: true)
  end

  def update
    @messages_unread = Message.where(founder_conversation_id: @founder_conversation_id).unread_by(current_user)
    @messages_unread.each do |message_unread|
      message_unread.mark_as_read! for: current_user
    end

    respond_to do |format|
      format.js { render action: 'update.js.erb' }
    end
  end

  private

  def set_founder_conversation_id
    @founder_conversation_id = params[:id]
  end
end
