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
    @chat = nil
    @chat_with = User.find(chat_params["user_id"])
    @current_user_memberships = current_user.memberships

    if @current_user_memberships.size > 0
      @current_user_memberships.each do |membership|
        @existing_membership = Membership.where(chat_id: membership.chat_id).where(user_id: @chat_with.id)[0]
        if @existing_membership
          @chat= Chat.find(@existing_membership.chat_id)
        end
      end
    end

    if @chat == nil
      @chat = Chat.new(title: @chat_with.username)
      @chat.save
      Membership.create(chat: @chat, user: current_user)
      Membership.create(chat: @chat, user: @chat_with)
    end

    redirect_to chat_path(@chat)
  end

  private

  def chat_params
    params.require(:chat).permit(:user_id)
  end

end
