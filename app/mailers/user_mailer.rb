class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #
  default :from => "leo424y@gmail.com"
  def notify_comment(user, group)
    @greeting = group
    mail to: "leo424y@gmail.com", subject: "歡迎字造"
  end
end
