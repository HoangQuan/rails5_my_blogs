class Message < ApplicationRecord
  UPDATEABLE_ATTRS = [:user_id, :content, :room_id]

  belongs_to :room
  validates :content, :user_id, :room_id, presence: true

  after_commit { MessageRelayJob.perform_later(self) }
end