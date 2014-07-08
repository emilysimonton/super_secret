class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  def new
    @poll = Poll.new
    2.times {@poll.options.new}
  end

  def show
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      redirect_to @poll
    else
      render "new", notice: "Please enter a question with two answers."
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
    params.require(:poll).permit(:question, :user_id, :options_attributes => [:answer])
  end
end
