class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :vote, :destroy]

  def index
    # find user first
    # find that user's polls
    # TESTING

    # TESTING

    @polls = current_user.polls
  end

  def new
    @poll = Poll.new
    @poll.expiration = Time.zone.now + 24.hours
    2.times {@poll.options.build}
  end

  def show
    # GET: takes you to edit or confirm
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.user = current_user
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
    #Not sure why accepts nested is not working as expected
    #This ugly thing iterates over poll options and updates them so no new ones
    #are created
    @poll.options.each_with_index do |option, index|
      opt = Option.find(option.id)
      opt.update(poll_params[:options_attributes][index.to_s])
    end
    #Then update poll, but not options_attributes
    if @poll.update(poll_params.except(:options_attributes))
      flash[:notice] = "Successfully updated poll."
      redirect_to poll_path(@poll)
    else
      flash[:notice] = "Something went wrong."
      render :edit
    end
  end

  def destroy
    @poll.destroy
    redirect_to polls_path
  end

  private
  def set_poll
    @poll = Poll.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:question, :expiration, :token, :user_id, :filepicker_url, :options_attributes=>[:answer, :filepicker_url])
  end
end
