class PoussePublicationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "pousse_publication_#{params[:pousse_publication_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
