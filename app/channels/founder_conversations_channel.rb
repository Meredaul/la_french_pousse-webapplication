class FounderConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "founder_conversation_#{params[:founder_conversation_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
