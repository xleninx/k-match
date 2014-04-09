class UserMailer < ActionMailer::Base
  default :from => "meetingapp.dev@gmail.com"

  def connection_request(student, prospect)
    @student = student
    @prospect = prospect
    mail(:to => "#{student.full_name} <#{student.email}>", :subject => "You@Kellogg Connection Request")
  end
end
