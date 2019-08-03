class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @founder_conversation = FounderConversation.find(params[:founder_conversation_id])
    @message.founder_conversation = @founder_conversation
    @message.user = current_user
    if @message.save
      @message.mark_as_read! for: @message.user
      respond_to do |format|
        # format.html { redirect_to founder_conversation_path(@founder_conversation) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "founder_conversations/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
