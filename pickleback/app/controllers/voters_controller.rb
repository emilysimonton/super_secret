class VotersController < ApplicationController

  def new
    @poll = Poll.find_by(token: params[:token])
  end

  def create
    @poll = Poll.find_by(token: params[:token])
    Option.increment_counter(:votes, params[:option])
    session[:voter] = SecureRandom.uuid

    redirect_to vote_path(@poll.token)
  end

  def show
  end


end
