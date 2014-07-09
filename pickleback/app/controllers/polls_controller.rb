class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  def new
    @poll = Poll.new
    @poll.expiration = Time.zone.now + 24.hours
    2.times {@poll.options.new}
  end

  def show
    # GET: takes you to edit or confirm
  end

  def vote
    # GET: poll for user to fill out
  end

  def results
    # POST: view results
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      redirect_to @poll
    else
      flash[:notice] = "Please enter a question with two answers."
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_poll
    @poll = Poll.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:question, :expiration, :user_id, :filepicker_url, :options_attributes => [:answer, :filepicker_url])
  end
end
