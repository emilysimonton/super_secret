class RecipientsController < ApplicationController
  before_action :set_poll, only: [:index, :new, :create]
  def index
    @recipients = session[:recipients]
  end

  def new
  end

  def create
    @message = params[:message]    
    # Approach 2: For single text box, comma separated emails
    session[:recipients] = params[:recipients]
    @recipients = session[:recipients]
    @invalid_emails = []
    @recipients.split(",").each do |email|
      email = email.strip
      email_errors = ValidatesEmailFormatOf::validate_email_format(email)
      @invalid_emails.push(email) if (email_errors && !email.empty?)
    end
    if @invalid_emails.empty?
      redirect_to poll_recipients_path(@poll)
    else
      flash.now[:error] = "The following emails are invalid: #{@invalid_emails.join(', ')}"
      render :new
    end

    # Approach 1: For multiple input boxes for emails
    # @recipients = []
    # @recipients = params[:recipients].reject(&:empty?)
    # @recipients.each do |recipient|
    #   UserMailer.poll_sender(@poll, recipient, @message).deliver
    # end
  end

  private
  def set_poll
    @poll = Poll.find(params[:poll_id])
  end

  def poll_params
    params.require(:recipient).permit(:email, :poll_id)
  end
end
