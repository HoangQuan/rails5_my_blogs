class MessagesController < ApplicationController
  before_action :set_room

  def create
    @message = Message.create! content: params[:message][:content], room: @room, user_id: [1,2].sample
  end

  private
  def set_room
    @room = Room.find(params[:message][:room_id])
  end
end
