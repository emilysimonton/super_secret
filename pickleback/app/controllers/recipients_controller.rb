class RecipientsController < ApplicationController
  def new
    # GET: asks you to share or input links
    @poll = Poll.find(params[:poll_id])
  end

  def create
    @poll = Poll.find(params[:poll_id])
    @message = params[:message]
    session[:recipients] = []
    session[:recipients] = params[:recipients].reject(&:empty?)
    session[:recipients].each do |recipient|
      binding.pry
      UserMailer.poll_sender(@poll, recipient, @message).deliver
    end
  end

  def destroy
  end

  private
  def poll_params
    params.require(:recipient).permit(:email, :poll_id)
  end
end
