class CommentsController < ApplicationController
  before_action :set_message

  def create
    @comment = Comment.create! content: params[:comment][:content], room_id: params[:comment][:room_id], user: 1
  end

  private
  def set_message
    @message = Message.find(params[:message_id])
  end
end
