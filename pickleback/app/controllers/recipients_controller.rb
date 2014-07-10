class RecipientsController < ApplicationController
  def new
    # GET: asks you to share or input links
    @poll = Poll.find(params[:poll_id])
  end

  def create
    @poll = Poll.find(params[:poll_id])
    params[:recipients].each do |recipient|
      #UserMailer.registration_confirmation(recipient).deliver
    end

  end

  def destroy
  end

  private
  def poll_params
    params.require(:recipient).permit(:email, :poll_id)
  end
end
