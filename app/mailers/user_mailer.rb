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


  def path_offer_driver_info_path_booked(path_offer_creator, name, params, utente, profileCreator)
    @name = name
    @params = params
    @path_offer_creator = path_offer_creator
    @profileCreator = profileCreator
    mail to: @path_offer_creator.email, subject: "Prenotazione viaggio", reply_to: "passaggioruby@gmail.com"  
  end


  def path_offer_delete_confirmation(user, params)
	  @user = user
    @params = params

    mail to: user.email, subject: "Conferma di prenotazione viaggio", reply_to: "passaggioruby@gmail.com"  	
  end

  def path_offer_notify_delete_confirmation(creator_email, user_creator, user_delete_path, path_offer)
    @creator_email = creator_email
    @user_creator = user_creator
    @user_delete_path = user_delete_path
    @path_offer = path_offer
    mail to: creator_email, subject: "Cancellazione prenotazione viaggio", reply_to: "passaggioruby@gmail.com"  
  end
end
