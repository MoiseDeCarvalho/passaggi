class UserMailer < ApplicationMailer
 #default from: "passaggioruby@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def path_offer_confirmation(user, params)
    @user = user
    @params = params

    mail to: user.email, subject: "Conferma di prenotazione viaggio", reply_to: "passaggioruby@gmail.com"
  end
end
