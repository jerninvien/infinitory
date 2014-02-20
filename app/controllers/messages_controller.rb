class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @message = Message.new
  end

  def create
    @feedback = Message.new(params[:message])
    @feedback.email = current_user.email
    @feedback.username = current_user.fullname
    @test = "test"
    if @feedback.valid?
      UserMailer.delay(retry: false).tester_email(@test)
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