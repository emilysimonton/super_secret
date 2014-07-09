class VotesController < ApplicationController

def new
  @poll = Poll.find_by(token: params[:token])
end

def create
  Option.increment_counter(:votes, params[:option])
end

end
