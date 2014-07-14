class UserMailer < ActionMailer::Base
  default from: "flatiron.picklebacks@gmail.com"
  def poll_sender(poll, recipient)
    @poll = poll
    @recipient = recipient
    @user = User.find(poll.user_id)
    mail(:to => recipient, :subject => "#{@user.name} has a question for you")
  end
end
