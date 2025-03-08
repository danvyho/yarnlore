class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    user = current_user
    @chats = Chat.joins(:memberships).where(memberships: { user_id: user.id })

    if params[:query].present?
      sql_subquery = <<~SQL
        chats.title @@ :query
        OR messages.content @@ :query
        OR users.username @@ :query
      SQL

      @chats = @chats.joins(:messages).joins(messages: :user).where(sql_subquery, query: "%#{params[:query]}%").distinct
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @messages = @chat.messages
    @message = Message.new
    @user = current_user
  end

  def create
    @chat_with = User.find(chat_params["user_id"])
    @chat = Chat.new(title: @chat_with.username)
    @chat.save
    Membership.create(chat: @chat, user: current_user)
    Membership.create(chat: @chat, user: @chat_with)
    redirect_to chat_path(@chat)
  end

  private

  def chat_params
    params.require(:chat).permit(:user_id)
  end

end
