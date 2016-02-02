class Feedback < MailForm::Base

  attr_accessor :send_to
  attr_accessor :sent_by

  attribute :message,      :validate => true
  attribute :grade,      :validate => true
  
  attribute :nickname,  :captcha  => true

  attributes :screenshot1, :attachment => true
  attributes :screenshot2, :attachment => true
  attributes :screenshot3, :attachment => true


  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Retroalimentación Tarea",
      :to => "#{send_to}",
      :from => %("#{sent_by}")
    }
  end

end