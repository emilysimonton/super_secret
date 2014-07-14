class ResultsController < ApplicationController

  def show
    @poll = Poll.find(params[:id])
    #binding.pry
    if Time.now >= @poll.expiration
      render :show
    end
  end
end
