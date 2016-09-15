class Message < ApplicationRecord
  UPDATEABLE_ATTRS = [:user_id, :content, :room_id]

  belongs_to :room
  validates :content, :user_id, :room_id, presence: true

  after_commit { ActionCable.server.broadcast "room_#{room_id}_messages",
      message: MessagesController.render(partial: 'messages/message', locals: { message: self }) }
end