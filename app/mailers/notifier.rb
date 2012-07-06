class Notifier < ActionMailer::Base
  default from: "'Rforum' <#{ENV['RF_EMAIL']}>"

  def new_comment(comment)
    @comment = comment

    mail(
      bcc: User.notificable.map(&:email), # Implementar suscripciones
      subject: "Hicieron un comentario en [#{comment.conversation.title}]"
    )
  end
end
