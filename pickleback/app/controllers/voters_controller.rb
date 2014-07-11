class VotersController < ApplicationController

  def new
    @poll = Poll.find_by(token: params[:token])
    @poll.voters.each do |voter|
      if session[:voter] == voter.uuid
        flash[:notice] = "You've already voted on this poll!"
        redirect_to root_path
      end 
    end 
  end

  def create
    @poll = Poll.find_by(token: params[:token])
    Option.increment_counter(:votes, params[:option])
    session[:voter] ||= SecureRandom.uuid
    voter = Voter.find_or_create_by(uuid: session[:voter])
    voter.polls << @poll
    redirect_to vote_path(@poll.token)
  end

  def show
  end


end
