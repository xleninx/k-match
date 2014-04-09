class HomeMailer < ActionMailer::Base
  default :from => "meetingapp.dev@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.full_name} <#{user.email}>", :subject => "You@Kellogg Registration")
  end

end
