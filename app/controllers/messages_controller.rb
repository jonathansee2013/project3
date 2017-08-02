class MessagesController < ApplicationController

before_action :check_if_logged_in, only: [:destroy]
before_action :get_message, only: [:show, :destroy]

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
    @message = Message.new message_params

    if @message.save
      session[:user_id] = @user.id
      redirect_to message_path(@user.id)
    else
      render :new
    end

  end

  def show
  end

  def destroy
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end

end
