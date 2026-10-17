class MessagesController < ApplicationController
  def index
    @messages = Message.order(created_at: :desc)
    @messages = @messages.where(color: params[:color]) if params[:color].present?
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      @messages = Message.order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to root_path
  end

  def like
    message = Message.find(params[:id])
    message.increment!(:likes)
    redirect_to root_path
  end

  private

  def message_params
    params.expect(message: [ :author, :content, :color ])
  end
end
