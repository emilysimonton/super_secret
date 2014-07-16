class UserMailer < ActionMailer::Base
  default from: "flatiron.picklebacks@gmail.com"
  def poll_sender(poll, recipient, message)
    @poll = poll
    @recipient = recipient
    @message = message
    @user = User.find(poll.user_id)
    mail(:to => recipient, :subject => "#{@user.name} has a question for you")
  end

  def poll_close(poll)
    @poll = poll
    @user = User.find(poll.user_id)
    mail(:to => @user.email, :subject => "#{@user.name}, see your poll results!")
  end
end
