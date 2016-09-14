class MessageRelayJob < ApplicationJob
  def perform(message)
    ActionCable.server.broadcast "room_#{comment.message_id}_messages",
      message: MessagesController.render(partial: 'messages/message', locals: { message: message })
  end
end