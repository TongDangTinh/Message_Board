class MessagesController < ApplicationController
  before_action :find_messge, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @messages = Message.all.order("created_at DESC")
  end

  def show
  end

  def new
    @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build message_params
    if @message.save 
      flash[:success] = "Created message"
      redirect_to root_path
    else
      render :new 
    end
  end

  def edit
  end

  def update
    if @message.update message_params
      flash[:success] = "Updated message"
      redirect_to message_path 
    else
      render :edit 
    end
  end

  def destroy
    @message.destroy
    flash[:danger] = "Deleted message"
    redirect_to root_path
  end

  private
    def message_params
      params.require(:message).permit :title, :description
    end

    def find_messge
      @message = Message.find params[:id]
    end
end
