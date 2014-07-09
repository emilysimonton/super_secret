class UserMailer < ActionMailer::Base
  default from: "flatiron.picklebacks@gmail.com"
  def poll_sender(@poll)
    @user = User.find(@poll.user_id)
    # After we create a user table!
    @poll.recipients.each do |recipient|
      mail(:to => recipient.email, :subject => "#{@user.name} has a question for you")
    end
  end
end
