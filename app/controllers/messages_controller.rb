class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    @email = current_user.email
    @username = current_user.fullname
    if @message.valid?
      UserMailer.delay(retry: false).feedback_email(@email, @username, @message)
      current_user.create_activity :feedback, owner: current_user
      redirect_to current_user, notice: "Your feedback is appreciated!"
    else
      render "new"
    end
  end

  private
    def message_params
      params.require(:message).permit(:message)
    end
end