class NotificationsMailer < ActionMailer::Base
  
  default :from => "info@mentormentored.org"
  default :to => "info@mentormentored.org"

  def new_message(message)
    @message = message
    mail(:subject => "Mentor Mentored #{message.subject}")
  end
end
