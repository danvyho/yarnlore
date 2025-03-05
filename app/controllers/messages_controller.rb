class MessagesController < ApplicationController

  def create
    @chat = Chat.find(params[:id])
    @message = Message.new(message_params)
    @message.chat = @chat
    temp_current_user = User.first
    @message.user = temp_current_user
    if @message.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages, partial: "chats/message",
            locals: { message: @message, user: temp_current_user })
        end
        format.html { redirect_to chat_path(@chat) }
      end
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
