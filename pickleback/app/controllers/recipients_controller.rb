class RecipientsController < ApplicationController
  def new
    # GET: asks you to share or input links
    @poll = Poll.find(params[:poll_id])
  end

  def create
    @poll = Poll.find(params[:poll_id])
    session[:recipients] = []
    session[:recipients] = params[:recipients]
    session[:recipients].each do |recipient|
      UserMailer.poll_sender(@poll, recipient).deliver
    end
  end

  def destroy
  end

  private
  def poll_params
    params.require(:recipient).permit(:email, :poll_id)
  end
end
