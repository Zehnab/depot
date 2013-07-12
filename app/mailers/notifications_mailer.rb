class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@zyafzal.mygbiz.com"
  default :to => "zyafzal@zyafzal.mygbiz.com"

  def new_message(message)
    @message = message
    
    mail(:subject => "[mmta.pagekite.me] #{message.subject}")
  end

end