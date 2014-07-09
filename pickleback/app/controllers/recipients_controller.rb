class RecipientsController < ApplicationController
  def new
    # binding.pry
    # GET: asks you to share or input links
    @poll = Poll.find(params[:poll_id])
    3.times {@poll.recipients.new}
  end

  def create
    @poll = Poll.find(params[:poll_id])
    params[:recipients].each do |recipient| 
      Recipient.create(:email => recipient[:email], :poll_id => @poll.id)
    end
      # if @recipient.save
      # UserMailer.registration_confirmation(@user).deliver
    # POST: adds recipients to database
    # calls method to send emails or create link

  end

  def destroy
  end

  private
  def poll_params
    params.require(:recipient).permit(:email, :poll_id)
  end
end
