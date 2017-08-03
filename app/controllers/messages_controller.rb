class MessagesController < ApplicationController

before_action :check_if_logged_in
before_action :get_message, only: [:destroy]

  def get_message
    @message = Message.find params["id"]
  end

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new({
      content: params["content"],
      receiver_id: params["receiver_id"],
      sender_id: @current_user.id
    })
    
    if @message.save
      redirect_to message_path(params[:receiver_id])
    else
      render :new
    end

  end

  def show
    query = "(sender_id = #{@current_user.id} AND receiver_id = #{params[:id]}) OR (receiver_id = #{@current_user.id} AND sender_id = #{params[:id]})"
    @all_messages = Message.where(query).order(created_at: :desc)
  end

  def destroy
  end

  private
  def message_params
    params.require(:message).permit(:content, :receiver_id)
  end

end
