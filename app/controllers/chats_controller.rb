class ChatsController < ApplicationController

  def index
    @chats = User.first.memberships.map(&:chat) # current_user
  end

  def show
    @chat = Chat.find(params[:id])
    @messages = @chat.messages
  end

end
