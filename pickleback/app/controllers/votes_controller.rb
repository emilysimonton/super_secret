class VotesController < ApplicationController

  def new
    @poll = Poll.find_by(token: params[:token])
  end

  def create
    @poll = Poll.find_by(token: params[:token])
    Option.increment_counter(:votes, params[:option])
    redirect_to vote_path(@poll.token)
  end

  def show
  end


end
