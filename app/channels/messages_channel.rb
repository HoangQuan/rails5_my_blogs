class MessagesChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "room_#{data['room_id'].to_i}_messages"
    ConnectedList.add(data['user_id'])
  end

  def unfollow(data)
    stop_all_streams
    ConnectedList.remove(data['user_id'])
  end
end
