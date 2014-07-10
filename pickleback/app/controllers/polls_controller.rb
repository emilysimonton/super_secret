class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :vote, :destroy]

  def index
    # find user first
    # find that user's polls
    # TESTING
    @user = User.new(name: "Jarica")
    poll = Poll.create(question: "What am I doing??")
    poll2 = Poll.create(question: "Quiz 2??")
    @user.polls << poll << poll2
    # TESTING
    
    @polls = @user.polls
  end

  def new
    @poll = Poll.new
    @poll.expiration = Time.zone.now + 24.hours
    2.times {@poll.options.new}
  end

  def show
    # GET: takes you to edit or confirm
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
    params.require(:poll).permit(:question, :expiration, :token, :user_id, :filepicker_url, :options_attributes => [:answer, :filepicker_url])
  end
end
