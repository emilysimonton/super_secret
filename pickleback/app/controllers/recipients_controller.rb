class RecipientsController < ApplicationController
  def new
    # GET: asks you to share or input links
    3.times {@recipient.new}
  end

  def create
    # POST: adds recipients to database
    # calls method to send emails or create link
    
  end

  def destroy
  end
end
